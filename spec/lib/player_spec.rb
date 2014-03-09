require 'spec_helper'

module FantasyBaseball

  describe Player do

    describe "when we create a new player" do
      before(:each) do
        @player = Player.new(player_id: "aardsda01")
      end
      it "should be a kind of player" do
        expect(@player).to be_kind_of(Player)
      end
      it "should have the player_id set" do
        expect(@player.player_id).to eq("aardsda01")
      end
      it "should set the player first name" do
        expect(@player.player_first_name).to eq("bob")
      end
      it "should set the player last name" do
        expect(@player.player_last_name).to eq("joens")
      end
      it "should set the player full name" do
        expect(@player.player_full_name).to eq("bob jones")
      end
    end

  end
end
