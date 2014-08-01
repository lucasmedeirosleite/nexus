require "spec_helper"

describe Nexus::Channel do

	describe "fields" do

		it { expect(subject).to respond_to(:last_local_address) }
		it { expect(subject).to respond_to(:remote_address) }

	end

	describe "api" do

		it { expect(subject).to respond_to(:send) }

	end

end