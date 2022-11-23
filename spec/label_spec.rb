require_relative '../src/label/label'

describe Label do
  label = Label.new('new', 'blue')
  it 'it should create a new instance of Label' do
    expect(label).to be_instance_of(Label)
  end
  item = Item.new('09/03/2020')
  it 'it should add label to ' do
    label.add_item(item)
    expect(label.items.length).to eq 1
  end
end
