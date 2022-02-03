% 1D dan 2D Self-Organizing Map
% Deskripsi masalah : Menentukan 1-dimensional dan 2-dimensional jaringan
% SOM untuk mewakili ruang input 2-dimensi

% Sample jumlah tiap-tiap cluster.
K = 200;
% Offset kelas
q = 1.1;
% Tentukan 4 kelompok (cluster) data masukan (input)
P =  [rand(1,K)-q rand(1,K)+q rand(1,K)+q rand(1,K)-q;
 rand(1,K)+q rand(1,K)+q rand(1,K)-q rand(1,K)-q];
% Plot cluster
plot(P(1,:),P(2,:),'g.')
hold on
grid on



% Langkah 2. Membuat dan melatih (rain) 1D-SOM
% Parameter SOM
dimensions = [100];
coverSteps = 100;
initNeighbor = 10;
topologyFcn = 'gridtop';
distanceFcn = 'linkdist';

% Menentukan net
net1 = selforgmap(dimensions,coverSteps,initNeighbor,topologyFcn,distanceFcn);

% Train
[net1,Y] = train(net1,P);

% Plot hasil 1D-SOM
plotsompos(net1,P);
grid on


% Langkah 3. membuat dan melatih 2D-SOM
% Parameter SOM
dimensions = [10 10];
coverSteps = 100;
initNeighbor = 4;
topologyFcn = 'hextop';
distanceFcn = 'linkdist';

% Menentukan net
net2 = selforgmap(dimensions,coverSteps,initNeighbor,topologyFcn,distanceFcn);

% Train
[net2,Y] = train(net2,P);

dimensions = [10 10];
coverSteps = 100;
initNeighbor = 4;
topologyFcn = 'hextop';
distanceFcn = 'linkdist';

% Menentukan net
net2 = selforgmap(dimensions,coverSteps,initNeighbor,topologyFcn,distanceFcn);
% Train
[net2,Y] = train(net2,P);

% Plot hasil 2D-SOM
% Plot data masukan dan posisi bobot SOM
plotsompos(net2,P);
grid on

% Plot SOM neighbor distances
plotsomnd(net2)

% Plot untuk setiap neuron SOM jumlah vektor input yang diklasifikasikan
figure
plotsomhits(net2,P)
