require_relative '../src/movie/movie'

describe Movie do
  movie1 = Movie.new('01/01/1945', true)
  movie2 = Movie.new('01/01/2018', true)
  movie3 = Movie.new('01/01/2018', false)

  it 'creates a new Movie' do
    expect(movie1).to be_an_instance_of Movie
    expect(movie2).to be_an_instance_of Movie
    expect(movie3).to be_an_instance_of Movie
  end

  it 'movie1 can be archived' do
    expect(movie1.can_be_archived?).to eq true
  end

  it 'movie2 can be archived' do
    expect(movie2.can_be_archived?).to eq true
  end

  it 'movie3 can not be archived' do
    expect(movie3.can_be_archived?).to eq false
  end
end