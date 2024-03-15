function count_words(filename)
    
    word_count = 0
    
    # Open the file in read mode
    file = open(filename, "r")
    
    # Read the contents of the file
    content = read(file, String)
    
    # Close the file
    close(file)
    
    # Count the words
    words = split(lowercase(content))
    word_count = length(words)
    
    return words, word_count

end

# Usage case 1
filename = "txt"
words, word_count = count_words(filename)
println("The number of words in $filename is: $word_count")

# Usage case 2

# println("The number of words in $filename is: $word_count")
