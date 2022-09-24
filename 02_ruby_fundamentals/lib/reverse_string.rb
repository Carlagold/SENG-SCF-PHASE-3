def reverse_string str
    # SOLVING AN ALGORITHM
    ## STEP BY STEP SUDO CODE
    # use some type loop
    # convert the str into an array
    # make a new array
    # loop through the array
        # add the characters into the new array at the beginging
    # join the new array 
    #        *
    # "example"
    # "elpmaxe"
    new_str = ""
    str.length.times do |i|
        char = str[i]
        new_str = char + new_str
    end

    return new_str

    # return

    # arr_of_chars = str.split("")

    # new_arr = []
    # arr_of_chars.each do |char|
    #     new_arr.prepend(char)
    # end

    # return new_arr.join

end