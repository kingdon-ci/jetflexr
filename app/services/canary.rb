class Canary
  def self.enabled?
    Flagger.enabled?
  end

  def self.flagger
    if Kubernetes.enabled?
      Flagger.api
    end
  end

  def self.status
    if Kubernetes.enabled?
      c = Flagger.canaries&.first

      if c.present?
        c.status&.conditions&.first&.reason
      else
        '(No canary objects found)'
      end
    end
  rescue K8s::Error::Forbidden => e
    '(Forbidden, cannot query canary statuses)'
  end

  def self.canary_statuses
    Kubernetes.pod_statuses(Kubernetes.canary_pods)
  rescue K8s::Error::Forbidden => e
    ["Could not query K8s, Error forbidden: #{e.message}"]
  end

  def self.primary_statuses
    Kubernetes.pod_statuses(Kubernetes.primary_pods)
  rescue K8s::Error::Forbidden => e
    ["Could not query K8s, Error forbidden: #{e.message}"]
  end
end
