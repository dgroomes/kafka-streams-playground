# kafka-streams-playground

Learning and exploring Kafka Streams <https://kafka.apache.org/documentation/streams/>.

---

This project is adapted from <https://github.com/dgroomes/vanilla-kafka> and <https://kafka.apache.org/25/documentation/streams/quickstart>.

It illuminates the threading model of Kafka Streams by sleeping for each input message. For example, if ten messages are
input, and the Kafka Streams topology is bound by one thread, then it will take ten seconds to process the messages. By
contrast, if the input Kafka topic has five partitions and the Kafka Streams app is configured with five threads, then
it should take as little as two seconds to process the messages! Experiment with different configurations of the input
topic, Kafka Streams topology operations, and Kafka Streams configurations.   

### Instructions

* Use Java 11.
* Running the application and the test cases depend on a locally running Kafka instance. Use the `startKafka` and 
  `stopKafka` commands (see [`commands.sh`](#commandssh)) to run Kafka and Zookeeper.
* In a new terminal, create the input and output Kafka topics with `createTopics`
* Build and run with `build && run`
* In a new terminal, start consuming the output Kafka topic with `consume` (you won't see anything until you start 
  producing!)
* In a new terminal, produce some test data with `produce`. You should see some data in your consumer! Next, try 
  `produce 10`. Continue to experiment!   

### `commands.sh`

Source the `commands.sh` file using `source commands.sh` which will load your shell with useful 
commands. Commands include:

  * `build` build (without running the tests)
  * `run` run the app
  * `consume` consume from the `my-messages` Kafka topic
  * `produce` produce a test message to the `my-messages` Kafka topic 
  * `currentOffsets` get current Kafka topic offsets for the `my-group` group 
  * `startKafka` start Kafka and Zookeeper
  * `stopKafka` stop Kafka and Zookeeper
  * `createTopics` create the input and output Kafka topics 
  * `cleanState` clean the Kafka Streams state directory (RocksDB data) for when things get messed up  
  
Dependencies required across all commands include:

  * `brew install kafka`
  * `brew install kafkacat`
  
### Wish List

Items I wish to implement for this project:

  * Should prefer using interrupts to stop KafkaConsumer? Even though KafkaConsumer recommends
    using a flag? See <https://kafka.apache.org/0110/javadoc/index.html?org/apache/kafka/clients/consumer/KafkaConsumer.html>
  * implement some tests
  * Make the Gradle files more idiomatic. There is so much to learn about Gradle and the Gradle Kotlin DSL! Without 
    knowing it, I can't make the Gradle files idiomatic. Fortunately, there is a lot of knowledge and advice in the 
    official docs <https://docs.gradle.org/current/userguide/kotlin_dsl.html> 
    
### Notes

A neat trick to check for processes that are using a port is to use the `lsof` command. For example, use

```echo "zookeeper port?" && lsof -i :2181; echo "kafka port?" && lsof -i :9092```

to check if Zookeeper and/or Kafka are running. 
