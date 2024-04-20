// Nicole McDermott
// I pledge my Honor that I have abided by the Stevens Honor System

import org.omnetpp.queueing.Queue;
import org.omnetpp.queueing.Source;
import org.omnetpp.queueing.Sink;

network SimpleQueue
{
    parameters:
        @display("i=block/network2");
    submodules:
        sink: Sink {
            @display("p=273,101");
        }
        queue: Queue {
            @display("p=165.0,79.0");
        }
        source: Source {
            @display("p=50.0,79.0");
        }
    connections:
        source.out --> queue.in++;
        queue.out --> sink.in++;
}

simple Sink
{
	parameters:
  @group(Queueing);
  @display("i=block/sink");
  @signal[lifeTime](type="simtime_t");
  @signal[totalQueueingTime](type="simtime_t");
  @signal[totalDelayTime](type="simtime_t");
  @signal[totalServiceTime](type="simtime_t");
  @signal[queuesVisited](type="int");
  @signal[delaysVisited](type="int");
  @signal[generation](type="int");
  @statistic[lifeTime](title="lifetime of arrived jobs";unit=s;record=vector,mean,max;interpolationmode=none);
  @statistic[totalQueueingTime](title="the total time spent in queues by arrived jobs";unit=s;record=vector?,mean,max;interpolationmode=none);
  @statistic[totalDelayTime](title="the total time spent in delay nodes by arrived jobs";unit=s;record=vector?,mean,max;interpolationmode=none);
  @statistic[totalServiceTime](title="the total time spent by arrived jobs";unit=s;record=vector?,mean,max;interpolationmode=none);
  @statistic[queuesVisited](title="the total number of queues visited by arrived jobs";record=vector?,mean,max;interpolationmode=none);
  @statistic[delaysVisited](title="the total number of delays visited by arrived jobs";record=vector?,mean,max;interpolationmode=none);
  @statistic[generation](title="the generation of the arrived jobs";record=vector?,mean,max;interpolationmode=none);
  bool keepJobs = default(false); // whether to keep the received jobs till the end of simulation
  gates:
  input in[];
}
