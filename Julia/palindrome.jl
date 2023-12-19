function is_palindrome(jomla::String)
    
    # Disregard non-alphanumeric characters and convert to lowercase
    cleaned_str = lowercase(join(filter(x -> isa(x, String), jomla)))
    
    # Check if the cleaned string is equal to its reverse
    return cleaned_str == reverse(cleaned_str)

end

# Usage case 1
word = "level"
result = is_palindrome(word)
println("Is \"$word\" a palindrome? $result")

# Usage case 2
sentence = "Was it a car or a cat I saw?"
result = is_palindrome(sentence)
println("Is \"$sentence\" a palindrome? $result")
