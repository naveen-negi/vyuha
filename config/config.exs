# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config


config :riak_core,
  ring_state_dir: 'ring_state_dir',
  handoff_port: 8099,
  handoff_ip: '127.0.0.1',
  schema_dirs: ['priv'],
  ring_creation_size: 12,
  vnode_inactivity_timeout: 1000

config :lager,
  colored: true,
  error_logger_hwm: 500

config :sasl,
  errlog_type: :error


# It is also possible to import configuration files, relative to this
# directory. For example, you can emulate configuration per environment
# by uncommenting the line below and defining dev.exs, test.exs and such.
# Configuration from the imported file will override the ones defined
# here (which is why it is important to import them last).
#
    # import_config "#{Mix.env}.exs"
