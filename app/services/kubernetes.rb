class Kubernetes
  def self.enabled?
    ENV['KUBERNETES_SERVICE_HOST'].present?
  end

  def self.client
    @client ||= K8s::Client.in_cluster_config
  end

  def self.namespace
    @@namespace ||= File.read('/var/run/secrets/kubernetes.io/serviceaccount/namespace')
  end

  def self.namespaced_pods
    client.api('v1').resource('pods', namespace: namespace).list
  end

  def self.pa_pods
    n = namespaced_pods
    n.select do |p|
      p.metadata.labels['app.kubernetes.io/instance'] == 'pa-dev' &&
        (p.metadata.labels['component'] == 'web' || \
         p.metadata.labels['component'] == 'web-primary')
    end
  end

  def self.primary_pods
    p = pa_pods
    p.select do |pod|
      pod.metadata.labels['component'] == 'web-primary'
    end
  end

  def self.canary_pods
    c = pa_pods
    c.select do |p|
      p.metadata.labels['component'] == 'web'
    end
  end

  def self.pod_statuses(pod_list)
    s = pod_list.map{|p| p.status.phase}
    # binding.pry
    s
  end
end
