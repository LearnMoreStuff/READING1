#!/bin/bash

ask_question() {
  local level=$1
  local passages
  local questions
  local answers
  local user_answer

  # Define passages and questions for each level
  declare -A level1_passages=(
    [1]="The cat sat on the mat. It was a sunny day."
  )

  declare -A level1_questions=(
    [1]="Where did the cat sit?"
  )

  declare -A level1_answers=(
    [1]="on the mat"
  )

  declare -A level2_passages=(
    [1]="Tom went to the market to buy some fresh vegetables. He bought carrots, potatoes, and broccoli."
  )

  declare -A level2_questions=(
    [1]="What did Tom buy at the market?"
  )

  declare -A level2_answers=(
    [1]="carrots, potatoes, and broccoli"
  )

  declare -A level3_passages=(
    [1]="In the middle of the forest, there was a small, hidden cabin. The cabin was surrounded by tall trees and the sound of birds chirping filled the air."
  )

  declare -A level3_questions=(
    [1]="What was the cabin surrounded by?"
  )

  declare -A level3_answers=(
    [1]="tall trees"
  )

  declare -A level4_passages=(
    [1]="The scientist worked tirelessly in his laboratory, trying to find a cure for the disease. He tested many different compounds, but none seemed to work. Finally, after months of research, he found a breakthrough."
  )

  declare -A level4_questions=(
    [1]="What was the scientist trying to find a cure for?"
  )

  declare -A level4_answers=(
    [1]="the disease"
  )

  case $level in
    1) passages=("${!level1_passages[@]}") ;;
    2) passages=("${!level2_passages[@]}") ;;
    3) passages=("${!level3_passages[@]}") ;;
    4) passages=("${!level4_passages[@]}") ;;
    *)
      echo "Invalid level."
      return 1
      ;;
  esac

  for i in ${passages[@]}; do
    passage="${!level${level}_passages[$i]}"
    question="${!level${level}_questions[$i]}"
    correct_answer="${!level${level}_answers[$i]}"

    echo -e "\nPassage: $passage"
    read -p "Question: $question " user_answer

    if [[ "$user_answer" == "$correct_answer" ]]; then
      echo "Correct! Well done!"
    else
      echo "Incorrect. The correct answer is '$correct_answer'."
    fi
  done

  return 0
}

main() {
  echo "Welcome to the reading quiz!"
  echo "Please pick a level:"
  echo "1. Beginner"
  echo "2. Intermediate"
  echo "3. Advanced"
  echo "4. Expert"

  read -p "Enter the level number you want to attempt: " level

  case $level in
    1|2|3|4)
      echo -e "\nYou have chosen Level $level. You will be asked questions based on the given passage."
      ask_question $level
      ;;
    *)
      echo "Invalid level selected. Exiting."
      ;;
  esac

  echo -e "\nQuiz made by LearnMoreStuff and CloIT."
}

main
