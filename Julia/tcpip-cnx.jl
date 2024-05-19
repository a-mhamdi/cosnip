using Sockets

srv = listen(1478)

while true
	cnx = accept(srv)
    @async begin
        while true
            cnt = readline(cnx)
            println("Got >>> " * cnt)
        end
    end
end

# ncat localhost 1478
