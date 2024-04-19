// Nicole McDermott
// I pledge my Honor that I have abided by the Stevens Honor System

simple Source
{
	parameters:
	    @display("i=block/source");
	    int limit = 100;
	gates:
	    input in;
	    output out;
}

simple Destination
{
 	parameters:
 	    @display("i=block/sink");
 	gates:
 	    input in;
 	    output out;   
}

network ARQ1
{
    @display("bgb=179,108");
    	types:
    	channel C extends ned.DatarateChannel{
    	datarate = 10bps;
    	ber = 0.1;
    	}
    submodules:
        source: Source {
            @display("p=40,42");
        }
        destination: Destination {
            @display("p=124,42");
        }
     connections:
         source.out --> C --> destination.in;
         destination.out --> source.in;
}
