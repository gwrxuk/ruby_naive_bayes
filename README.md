# Ruby Naive Bayes Classifier for Diabetes Prediction

This Ruby project implements a Naive Bayes Classifier designed to predict diabetes based on several medical measurements. The classifier utilizes Gaussian Naive Bayes to handle numerical data, making it suitable for medical datasets where attributes are represented by continuous variables.

## Features

- Gaussian Naive Bayes implementation for numerical data.
- Simple interface for training and prediction.
- Example dataset for demonstration and testing purposes.

## Getting Started

### Prerequisites

Ensure you have Ruby installed on your system. You can verify your Ruby installation by running:

```bash
ruby -v
```

### Installation

Clone the repository to your local machine:

```bash
git clone https://github.com/gwrxuk/ruby_naive_bayes
cd ruby_naive_bayes
```

### Usage

The classifier can be used by creating an instance of the `NaiveBayesClassifier` class, training it with a dataset, and then using it to make predictions. Here is a simple example:

```ruby
require_relative 'naive_bayes'

# Example Data: [Glucose Level, Blood Pressure, Insulin, BMI, Output (0 = Non-Diabetic, 1 = Diabetic)]
dataset = [
  [148, 72, 0, 33.6, 1],
  # Add more data points here...
]

# Initialize Classifier
classifier = NaiveBayesClassifier.new

# Train Classifier
classifier.train(dataset)

# Predict
prediction = classifier.predict([140, 70, 0, 30.5]) # Example input vector
puts prediction # Output: 1 (Diabetic) or 0 (Non-Diabetic) based on input vector
```

## Contributing

Contributions to improve the project are welcome. Please follow these steps:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature/AmazingFeature`).
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`).
4. Push to the branch (`git push origin feature/AmazingFeature`).
5. Open a pull request.

## License

Distributed under the MIT License. See `LICENSE` for more information.

## Acknowledgments

- This project is a simple demonstration of Naive Bayes Classifier in Ruby.
- Inspired by the need for open-source machine learning tools in Ruby.
