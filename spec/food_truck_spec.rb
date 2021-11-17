require './lib/item'
require './lib/food_truck'

RSpec.describe FoodTruck do
  context 'Iteration I' do
    let(:food_truck) {FoodTruck.new("Rocky Mountain Pies")}

    let(:item1) {Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})}
    let(:item2) {Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})}
    describe 'FoodTruck' do
      it 'exists' do

        expect(food_truck).to be_a(FoodTruck)
      end

      it 'has attributes' do

        expect(food_truck.name).to eq("Rocky Mountain Pies")
        expect(food_truck.inventory).to eq({})
      end

      it 'can check stock of items' do

        expect(food_truck.check_stock(item1)).to eq(0)
      end

      it 'can add stock to inventory' do
        food_truck.stock(item1, 30)

        expect(food_truck.inventory).to eq({item1 => 30})
      end

      it 'can have multiple items in stock' do
        food_truck.stock(item1, 30)
        food_truck.stock(item1, 25)
        expect(food_truck.check_stock(item1)).to eq(55)
        food_truck.stock(item2, 12)
        expect(food_truck.inventory).to eq({item1 => 55, item2 => 12})
      end
    end

    describe 'Multiple food_truck time' do
      let(:item3) {Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})}
      let(:item4) {Item.new({name: "Banana Nice Cream", price: "$4.25"})}

      let(:food_truck1) {FoodTruck.new("Rocky Mountain Pies")}
      let(:food_truck2) {FoodTruck.new("Ba-Nom-a-Nom")}
      let(:food_truck3) {FoodTruck.new("Palisade Peach Shack")}

      before :each do
        food_truck1.stock(item1, 35)
        food_truck1.stock(item2, 7)

        food_truck2.stock(item4, 50)
        food_truck2.stock(item3, 25)

        food_truck3.stock(item1, 65)
      end

      it 'can calculate potential revenue' do

        expect(food_truck1.potential_revenue).to eq(148.75)
        expect(food_truck2.potential_revenue).to eq(345.00)
        expect(food_truck3.potential_revenue).to eq(243.75)
      end
    end
  end
end