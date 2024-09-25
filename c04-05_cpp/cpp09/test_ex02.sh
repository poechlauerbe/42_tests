#!/bin/bash

# File to store inputs that caused errors
ERROR_FILE="error_inputs.txt"

# Number of test iterations
NUM_TESTS=200

MAX_COMPARISONS=(0 1 3 5 7 10 13 16 19 22 26 30 34 38 42 46 50 54 58 62 66 71 76 81 86 91 96 101 106 111 116 121 126)

# Function to generate random input
generate_input() {
    # Generate a sequence of random numbers
    seq=$(shuf -i 0-2147483647 -n $1)
    echo $seq
}

extract_comparisons() {
    echo "$1" | grep -oP 'Comparisons: \K[0-9]+'
}

# Function to extract the sorted list from the output
extract_sorted_list() {
    echo "$1" | grep -oP 'After: \K.*'
}

is_sorted() {
    sorted_list=($1)
    for ((i = 1; i < ${#sorted_list[@]}; i++)); do
        if (( sorted_list[i-1] > sorted_list[i] )); then
            return 1 # Not sorted
        fi
    done
    return 0 # Sorted
}

# Start testing loop
for ((i=1; i<=NUM_TESTS; i++)); do
	echo
    echo "Test $i:"

	INPUT_SIZE=$i

    # Generate random input of numbers (e.g., 15 numbers)
    INPUT=$(generate_input $INPUT_SIZE)

    # Run the program with the generated input
    OUTPUT=$(./PmergeMe "$INPUT")
    RETVAL=$?

	# Extract the number of comparisons from the output
    COMPARISONS=$(extract_comparisons "$OUTPUT")

    # Get the corresponding max comparisons based on input size
	if [ "$INPUT_SIZE" -lt 34 ]; then
    	MAX_COMPARISONS_FOR_SIZE=${MAX_COMPARISONS[$((INPUT_SIZE - 1))]}
	fi

    # Check if the program returned an error (return value is 1)
    # if [ $RETVAL -ne 0 ]; then
    #     echo "Error detected in test $i. Storing input."
    #     echo "Test $i - Input: $INPUT" >> $ERROR_FILE
	# elif [ "$COMPARISONS" -gt "$MAX_COMPARISONS_FOR_SIZE" ]; then
    #     echo "Test $i failed. Too many comparisons ($COMPARISONS > $MAX_COMPARISONS_FOR_SIZE). Storing input."
    #     echo "Test $i - Input: $INPUT - Comparisons: $COMPARISONS" >> $ERROR_FILE
    # else
    #     echo "Test $i passed."
    # fi

	if [ "$INPUT_SIZE" -lt 34 ]; then
        # Extract the number of comparisons from the output
        COMPARISONS=$(extract_comparisons "$OUTPUT")

        # Get the corresponding max comparisons based on input size
        MAX_COMPARISONS_FOR_SIZE=${MAX_COMPARISONS[$INPUT_SIZE - 1]}

        # Check if COMPARISONS is a valid integer before comparing
        if [[ -n "$COMPARISONS" && "$COMPARISONS" =~ ^[0-9]+$ ]]; then
            # Check if comparisons exceed the allowed maximum
            if [ "$COMPARISONS" -gt "$MAX_COMPARISONS_FOR_SIZE" ]; then
                echo "Test $i failed. Too many comparisons ($COMPARISONS > $MAX_COMPARISONS_FOR_SIZE). Storing input."
                echo "Test $i - Input: $INPUT - Comparisons: $COMPARISONS" >> $ERROR_FILE
            else
                echo "Test $i passed with comparisons check."
            fi
        else
            echo "Warning: No line with 'Comparisons:' found! No comparison check performed."
        fi
    else
        echo "Input size $INPUT_SIZE is greater than 33. No comparisons check performed."
    fi


    # Extract the sorted list from the output
    SORTED_LIST=$(extract_sorted_list "$OUTPUT")

    # Check if the sorted list is correctly sorted
    if is_sorted "$SORTED_LIST"; then
        echo "Test $i passed with sorting check."
    else
        echo "Test $i failed. Output is not sorted correctly. Storing input."
        echo "Test $i - Input: $INPUT - Output: $SORTED_LIST" >> $ERROR_FILE
    fi

    # Check if the program returned an error (return value is 1)
    if [ $RETVAL -ne 0 ]; then
        echo "Error detected in test $i. Storing input."
        echo "Test $i - Input: $INPUT" >> $ERROR_FILE
	else
		echo "Test $i passed."
    fi

    # Optionally, you can also output the program output if needed
    # echo "$OUTPUT"
    # echo "----------------------------------"
done

echo "Testing completed."
