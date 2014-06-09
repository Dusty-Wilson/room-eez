require 'spec_helper'

describe Bill do

	it {should have_db_column(:name)}
	it {should have_db_column(:description)}
	it {should have_db_column(:creator_id)}
	
	let(:bill) {Bill.new(:name => 'Utilities',
											 :description => 'For June',
											 :creator_id => 1,
											 :cost => 35)}

	describe "bill" do
		it 'should be an instance of a Bill object' do
			expect(bill).to be_a Bill
		end 
		it { should belong_to(:creator).class_name("User") }

		it { should have_many(:bill_participations) }
		it { should have_many(:debtors).through(:bill_participations).source(:user) }

	end 

	describe "#name" do
		it 'should return the bill name' do
			expect(bill.name).to eq "Utilities"
		end 
	end 

	describe "#description" do
		it 'should return the bill description' do
			expect(bill.description).to eq "For June"
		end 
	end 

	describe "#creator_id" do
		it 'should return the bill creator ID' do
			expect(bill.creator_id).to eq 1
		end
	end

	describe "#cost" do
		it 'should return the bill cost' do
			expect(bill.cost).to eq 35
		end
		it 'Should reuturn the cost as a float' do
			expect(bill.cost.class).to eq Float
		end
	end	 

	context "validates presence of" do
		it {bill.should validate_presence_of(:name)}
		it {bill.should validate_presence_of(:description)}
		it {bill.should validate_presence_of(:creator_id)}
		it {bill.should validate_presence_of(:cost)}
	end






end
