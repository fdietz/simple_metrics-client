# encoding: utf-8
require "socket"
require "logger"

module SimpleMetrics
  class Client

    attr_reader :host, :port
    
    def self.logger=(logger)
      @@logger = logger
    end

    def self.logger
      @@logger ||= Logger.new($stdout)
    end

    def initialize(host, port = 8125)
      @host, @port = host, port
    end

    # send relative value
    def increment(stat, sample_rate = 1)
      count(stat, 1, sample_rate)
    end

    # send relative value
    def count(stat, count, sample_rate = 1)
      send_data( stat, count, 'c', sample_rate)
    end

    # send absolute value
    def gauge(stat, value)
      send_data(stat, value, 'g')
    end

    private

    def sampled(sample_rate, &block)
      if sample_rate < 1
        block.call if rand <= sample_rate
      else
        block.call
      end
    end

    def send_data(stat, delta, type, sample_rate = 1)
      sampled(sample_rate) do
        data = "#{stat}:#{delta}|#{type}" # TODO: check stat is valid
        data << "|@#{sample_rate}" if sample_rate < 1
        send_to_socket(data)
      end
    end

    def send_to_socket(data)
      logger.debug "SimpleMetrics Client send: #{data}"
      socket.send(data, 0, @host, @port)
    rescue => e
      logger.error "SimpleMetrics Client error: #{e}"
    end

    def socket
      @socket ||= UDPSocket.new 
    end

    def logger
      self.class.logger
    end

  end
end