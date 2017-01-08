defmodule Vyuha do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false
     :ok = :riak_core.register([{:vnode_module, Vyuha.Vnode}])
     :ok = :riak_core_node_watcher.service_up(Vyuha.Service, self)

    children = [
      worker(:riak_core_vnode_master, [Vyuha.Vnode], id: Vyuha.Vnode_master_worker)
    ]

    opts = [strategy: :one_for_one, name: Vyuha.Supervisor, max_restarts: 5, max_seconds: 10]
    Supervisor.start_link(children, opts)
  end
end
