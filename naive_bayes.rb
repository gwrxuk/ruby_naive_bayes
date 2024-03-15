class NaiveBayesClassifier
  attr_accessor :summaries, :categories

  def initialize
    @summaries = {}
    @categories = {}
  end

  def train(data)
    separate_by_class(data)
    summaries.each do |category, instances|
      summaries[category] = summarize(instances)
    end
  end

  def predict(input_vector)
    probabilities = calculate_class_probabilities(input_vector)
    probabilities.max_by{|_, probability| probability}.first
  end

  private

  def separate_by_class(data)
    data.each do |instance|
      vector = instance[0...-1]
      category = instance.last
      @categories[category] ||= []
      @categories[category] << vector
    end
    @categories.each do |category, instances|
      @summaries[category] = summarize(instances)
    end
  end

  def summarize(instances)
    instances.transpose.map do |attribute|
      [mean(attribute), standard_deviation(attribute)]
    end
  end

  def mean(numbers)
    numbers.sum.to_f / numbers.size
  end

  def standard_deviation(numbers)
    avg = mean(numbers)
    variance = numbers.map{|num| (num - avg) ** 2}.sum / (numbers.size - 1)
    Math.sqrt(variance)
  end

  def calculate_probability(x, mean, stdev)
    exponent = Math.exp(-(x - mean) ** 2 / (2 * stdev ** 2))
    (1 / (Math.sqrt(2 * Math::PI) * stdev)) * exponent
  end

  def calculate_class_probabilities(input_vector)
    probabilities = {}
    summaries.each do |class_value, class_summaries|
      probabilities[class_value] = 1
      class_summaries.each_with_index do |(mean, stdev), index|
        x = input_vector[index]
        probabilities[class_value] *= calculate_probability(x, mean, stdev)
      end
    end
    probabilities
  end
end

# Training Data: [Glucose Level, Blood Pressure, Insulin, BMI, Output (0 = Non-Diabetic, 1 = Diabetic)]
dataset = [
  [148, 72, 0, 33.6, 1],
  [85, 66, 0, 26.6, 0],
  [183, 64, 0, 23.3, 1],
  [89, 66, 94, 28.1, 0],
  [137, 40, 168, 43.1, 1],
  [116, 74, 0, 25.6, 0],
  [78, 50, 88, 31.0, 1],
  [115, 0, 0, 35.3, 0],
  [197, 70, 0, 30.5, 1],
  [125, 96, 0, 0.0, 1]
]

# Initialize Classifier
classifier = NaiveBayesClassifier.new

# Train Classifier
classifier.train(dataset)

# Predict
prediction = classifier.predict([140, 70, 0, 30.5]) # Example input vector
puts prediction # Output: 1 (Diabetic) or 0 (Non-Diabetic) based on input vector

