# This file is used by Rack-based servers to start the application.

if defined?(Unicorn)
	require 'unicorn/worker_killer'
	use Unicorn::WorkerKiller::MaxRequests, 100, 150
	use Unicorn::WorkerKiller::Oom, 150 * 1024 * 1024, 200 * 1024 * 1024
end

require ::File.expand_path('../config/environment',  __FILE__)
run Rails.application
