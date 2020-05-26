#!/usr/bin/env bash

export KAFKA_STREAMS_ROOT_DIR=$(pwd)

# Build (without the tests)
build() {
  "$KAFKA_STREAMS_ROOT_DIR"/scripts/build.sh
}

# Run the app
run() {
  "$KAFKA_STREAMS_ROOT_DIR"/scripts/run.sh
}

# Get the current offsets of the app's Kafka consumer group
currentOffsets() {
  "$KAFKA_STREAMS_ROOT_DIR"/scripts/current-offsets.sh
}

# Consume from the Kafka topic
consume() {
  "$KAFKA_STREAMS_ROOT_DIR"/scripts/consume.sh
}

# Produce a test message to the Kafka topic
produce() {
  "$KAFKA_STREAMS_ROOT_DIR"/scripts/produce.sh $@
}

# Create the input and output Kafka topics
createTopics() {
  "$KAFKA_STREAMS_ROOT_DIR"/scripts/create-topics.sh $@
}

# Start Zookeeper and Kafka
startKafka() {
  "$KAFKA_STREAMS_ROOT_DIR"/scripts/start-kafka.sh $@
}

# Stop Zookeeper and Kafka
stopKafka() {
  "$KAFKA_STREAMS_ROOT_DIR"/scripts/stop-kafka.sh $@
}