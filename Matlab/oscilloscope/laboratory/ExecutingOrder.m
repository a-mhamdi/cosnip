global nameHost;
nameHost='localhost';
while 1,
message=client(nameHost, 4012, -1);
message=char(message);
run(message);
end