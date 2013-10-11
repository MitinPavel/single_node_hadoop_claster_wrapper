name "single_node_hadoop_claster_wrapper"

description      "Installs and configures Apt, Java, jRuby and Hadoop 1.0.x on a Single Linux Node."
version          "0.0.2"

maintainer       "Pavel Mitin"
maintainer_email "mitin.pavel@gmail.com"

license          "MIT"

depends "apt"  
depends "java"  
depends "rbenv" 
depends "single_node_hadoop_claster"
