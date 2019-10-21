
% You can change the number of cities up to 10 by changing "numberOfCities" variable,

% the Recursive Algorithm works slow as we stated 
% in the paper. It works well for very small amount of cities. For example for
% 10 cities recursive alg. takes 20 minutes to show the result.

numberOfCities = 7;

cityNames = [ "Yerevan", "Vedi", "Vayk", "Vardenis","Vanadzor", "Tsakhkadzor", "Tashir", "Talin", "Spitak", "Sisian"];


distances = [0	55	137	178	120	56	159	67	100	207 ;
            55	0	95	233	175	111	214	122	155	165 ;
            137	95	0	120	229	193	297	204	237	68  ;
            178	233	120	0	162	138	213	231	182	190 ;
            120	175	229	162	0	106	51	119	20	300 ;
            56	111	193	138	106	0	157	111	126	263 ;
            159	214	297	213	51	157	0	158	59	350	;
            67	122	204	231	119	111	158	0	99	274	;
            100	155	237	182	20	126	59	99	0	320	;
            207	165	68	190	300	263	350	274	320	0	];


% the Dynamic Programming version of algorithm
dynamicProg(distances, numberOfCities, cityNames);

% the Recursive version of algorithm, the recursive version only gives the
% minimum cost(not the route)
recursiveAlgo(distances, numberOfCities);


% _______________________________________________________________________
%
%  Uncomment the below part to test the example we discussed in our
%  project paper.
%
% distances = [0 9 15 10; 
%           4 0 8 11; 
%           7 12 0 10; 
%           5 6 7 0];
%
% numberOfCities = 4;
% 
% cityNames = [ "first", "second", "third", "forth" ];
%
% dynamicProg(distances, numberOfCities, cityNames);
%
% recursiveAlgo(distances, numberOfCities);
%


