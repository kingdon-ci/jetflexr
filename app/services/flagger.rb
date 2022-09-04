class Flagger
  def self.enabled?
    if Kubernetes.enabled?
      @@enabled ||=
      ! Kubernetes.
        client.api(api_version).
        resource('canaries').list.nil?
    end
  rescue K8s::Error::NotFound, K8s::Error::Forbidden => e
    @@enabled = nil
  end

  def self.canaries
    api.resource('canaries', namespace: namespace).list
  rescue K8s::Error::NotFound => e
    nil
  end

  def self.namespace
    Kubernetes.namespace
  end

  def self.api
    Kubernetes.client.api(api_version)
  end

  def self.api_version
    'flagger.app/v1beta1'
  end
end
