# encoding: utf-8
require "spec_helper"

module SimpleMetrics

  describe Client do

    before do
      @client = SimpleMetrics::Client.new('localhost')
    end

    describe "#initialize" do
      it "sets host and port" do
        @client.host.should == 'localhost'
        @client.port.should == 8125
      end
    end

    describe "#increment" do
      it "sends increment correctly" do
        mock(@client).send_to_socket("test:1|c")
        @client.increment("test")
      end
    end

    describe "#count" do
      it "sends count data correctly" do
        mock(@client).send_to_socket("test:5|c")
        @client.count("test", 5)
      end
    end

    describe "#gauge" do
      it "sends gauge data correctly" do
        mock(@client).send_to_socket("test:10|g")
        @client.gauge("test", 10)
      end
    end
  end

end
