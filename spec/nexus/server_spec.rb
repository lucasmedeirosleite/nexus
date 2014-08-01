require "spec_helper"

describe Nexus::Server do

	describe "fields" do

		it { expect(subject).to respond_to(:port) }
		it { expect(subject).to respond_to(:ip) }

	end

end