worker_processes 1
pid 'tmp/pids/unicorn.pid'
stderr_path 'log/unicorn.stderr.log'
stdout_path 'log/unicorn.stdout.log'
timeout 180

listen 3000

preload_app false

GC.respond_to?(:copy_on_write_friendly=) and  GC.copy_on_write_friendly = true

before_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.connection.disconnect!
end

after_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.establish_connection
end
