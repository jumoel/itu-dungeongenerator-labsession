load "evolution.rb"

class MetaEvolution
	def initialize
		# regular evolution
		@population_size = 100
		@iterations = 100
		@width = 10
		@height = 10

		# meta
		@meta_population_size = 100
		@meta_iterations = 100

		e = create_evolution([0.7, 0.1, 3, 3, 50, 20, 15])
		puts e.fitness

		@meta_iterations.times do |i|

		end
	end

	private

	FLOOR_PROBABILITY = 0
	MUTATE_PROBABILITY = 1
	CROSSOVER_BLOCK_WIDTH = 2
	CROSSOVER_BLOCK_HEIGHT = 3
	POPULATION_KILL_COUNT = 4
	POPULATION_MUTATE_COUNT = 5
	POPULATION_CROSSOVER_COUNT = 6

	def create_population(size)
		Array.new(size) { |i| create_evolution(random_genome) }
	end

	def random_genome
		a = Array.new(7)
		a[FLOOR_PROBABILITY] = floor_probability
		a[MUTATE_PROBABILITY] = mutate_probability
		a[CROSSOVER_BLOCK_WIDTH] = crossover_block_width
		a[CROSSOVER_BLOCK_HEIGHT] = crossover_block_height
		a[POPULATION_KILL_COUNT] = population_kill_count
		a[POPULATION_MUTATE_COUNT] = population_mutate_count
		a[POPULATION_CROSSOVER_COUNT] = population_crossover_count
		a
	end

	def create_evolution(e)
		Evolution.new(@population_size, @width, @height, @iterations,
			      e[FLOOR_PROBABILITY], e[MUTATE_PROBABILITY],
			      e[CROSSOVER_BLOCK_WIDTH], e[CROSSOVER_BLOCK_HEIGHT],
			      e[POPULATION_KILL_COUNT], e[POPULATION_MUTATE_COUNT], e[POPULATION_CROSSOVER_COUNT])
	end

	def floor_probability
		rand(nil)
	end

	def mutate_probability
		rand(nil)
	end

	def crossover_block_width
		rand(1..10)
	end

	def crossover_block_height
		rand(1..10)
	end

	def population_kill_count(max = @population_size)
		rand(1..max)
	end

	def population_mutate_count(max = @population_size)
		rand(1..max)
	end

	def population_crossover_count(max = @population_size)
		rand(1..max)
	end
end

MetaEvolution.new