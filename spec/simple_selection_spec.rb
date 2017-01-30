require "spec_helper"
require_relative "../lib/simple_selection"

RSpec.describe SimpleSelection do
  subject(:data) { [Entry.new(10,10_000,100,50),
                    Entry.new(15,15_000,110,55),
                    Entry.new(10,20_000,200,150),
                    Entry.new(25,60_000,90, 80),
                    Entry.new(50,120_000,120,60),
                    Entry.new(34,64_000,120,70),
                    Entry.new(26,30_000,176,66),
                    Entry.new(27,20_000,170,56),
                    Entry.new(99,660_000,198,78),
                    Entry.new(76,58_000,173,87),
                    Entry.new(64,153_000,175,76),
                    Entry.new(14,140_000,120,40),
                    Entry.new(53,10_000,34,120),
                    Entry.new(12,10_000,100,50),
                    Entry.new(61, 423187, 81, 23),
                    Entry.new(98, 404355, 179, 49),
                    Entry.new(68, 245630, 84, 188),
                    Entry.new(77, 649929, 197, 189),
                    Entry.new(70, 857892, 180, 42),
                    Entry.new(61, 570767, 38, 53),
                    Entry.new(90, 177544, 24, 44),
                    Entry.new(1, 506153, 110, 12),
                    Entry.new(56, 874543, 90, 17),
                    Entry.new(95, 256135, 41, 84),
                    Entry.new(91, 288155, 155, 172),
                    Entry.new(70, 854934, 10, 107),
                    Entry.new(43, 722567, 12, 173),
                    Entry.new(62, 908971, 16, 187),
                    Entry.new(41, 375746, 29, 178),
                    Entry.new(51, 437800, 192, 132),
                    Entry.new(40, 117206, 154, 54),
                    Entry.new(74, 67568, 2, 122),
                    Entry.new(78, 485425, 168, 57),
                    Entry.new(0, 535808, 5, 189),
                    Entry.new(57, 492172, 88, 69),
                    Entry.new(14, 250261, 52, 31),
                    Entry.new(76, 552140, 66, 164),
                    Entry.new(66, 922543, 194, 53),
                    Entry.new(99, 492152, 193, 52),
                    Entry.new(10, 663243, 87, 194),
                    Entry.new(2, 66415, 121, 92),
                    Entry.new(53, 754252, 38, 150),
                    Entry.new(43, 899784, 93, 100),
                    Entry.new(59, 244253, 126, 110)] }
  describe '.search' do
    context 'returns results' do
      it 'returns results of one condition' do
        expect((SimpleSelection.search(data) { |n| n.age > 20 }).size).to eq(34) 
      end
      it 'returns results of range condition' do
        expect((SimpleSelection.search(data) { |n| n.age > 20 && n.age < 50 }).size).to eq(8)
      end
      it 'returns results of two different conditions' do
        expect((SimpleSelection.search(data) { |n| n.age > 20 && n.salary < 50_000 }).size).to eq(3)
      end
      it 'returns results of two ranged conditions' do
        expect((SimpleSelection.search(data) { |n| n.age > 20 && n.age < 50 && n.salary < 50_000 && n.salary > 10_000 }).size).to eq(2)
      end
    end
    context 'results responds as Entry object' do
      it 'responds to Entry methods' do
        %i(age salary height weight).each do |method|
          (SimpleSelection.search(data) { |n| n.age > 20 }).each do |entry|
            expect(entry).to respond_to(method)
          end
        end
      end
    end
  end
end
