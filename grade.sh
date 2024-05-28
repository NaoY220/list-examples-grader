CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'
echo ""



# check if the file exits
# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

if [[ -f student-submission/ListExamples.java ]]
    then
        echo "ListExamples.java file exist"
        cp student-submission/ListExamples.java TestListExamples.java grading-area
        echo "ListExamples.java submission grade: 100%"
fi
if [[ -f student-submission/FileExample.java ]]
    then
        echo "FileExample.java file exist"
        #cp student-submission/FileExample.java TestFileExample.java grading-area
        echo "FileExample.java submission grade: 100%"
fi
if [[ -f student-submission/LinkedListExample.java ]]
    then
        echo "LinkedListExample.java file exist"
        #cp student-submission/LinkedListExample.java LinkedListExample.java grading-area
        echo "LinkedListExample.java submission grade: 100%"
fi  
if [[ -f student-submission/ArrayExamples.java ]]
    then
        echo "ArrayExamples.java file exist"
        cp student-submission/ArrayExamples.java student-submission/ArrayTests.java grading-area
        echo "ArrayExamples.java submission grade: 100%"
fi
if [[ -f student-submission/ArrayTests.java ]]
    then
        echo "ArrayTests.java file exist"
        #cp student-submission/ArrayTests.java ArrayTests.java grading-area
        echo "ArrayTests.java submission grade:100%"
else
    echo "java file(s) does not exist"
    echo "exit: 3"
    exit 3
fi

cp lib grading-area

# check if compile successfuly
# Then, add here code to compile and run, and do any post-processing of the
# tests

if [[ -f student-submission/ListExamples.java ]]
    then
        javac -cp $CPATH student-submission/ListExamples.java TestListExamples.java
        echo "The exist code of javac is $?"
        echo ""

        if [[ $? == 0 ]]
            then
            echo "ListExamples.java compiled successfully!"
            echo "grade on ListExamples.java : 100%"
            echo "overal grade"
        else
            echo "ListExamples.java compiled error!"
            set -e
            java -cp ListExamplesTest > outListEx.txt
            cat out.txt
        fi
fi

if [[ -f student-submission/ArrayExamples.java ]]
    then
        javac -cp $CPATH student-submission/ArrayExamples.java student-submission/ArrayTests.java
        echo "The exist code of javac is $?"
        echo ""
        if [[ $? == 0 ]]
            then
            echo "ArrayExamples.java compiled successfully!"
            echo "grade on ArrayExamples.java: 100%"
        else
            echo "ArrayExamples.java compiled error!"
            set -e
            java -cp ArrayTests > outarrayEx.txt
            cat out.txt
        fi
fi

if [[ -f student-submission/FileExample.java ]]
    then
        javac student-submission/FileExample.java
        echo "The exist code of javac is $?"
        echo ""
        if [[ $? == 0 ]]
            then
            echo "FileExample.java compiled successfully!"
            echo "grade on FileExample.java: 100%"
        else
            echo "FileExample.java compiled error!"
            set -e
            java -cp FileTest > outarrayEx.txt
            cat out.txt
        fi
fi

if [[ -f student-submission/LinkedListExample.java ]]
    then
        javac student-submission/LinkedListExample.java
        echo "The exist code of javac is $?"
        echo ""
        if [[ $? == 0 ]]
            then
            echo "LinkedListExample.java compiled successfully!"
            echo "grade on FileExample.java: 100%"
        else
            echo "LinkedListExample.java compiled error!"
            set -e
            java -cp TestLinkedListExample > outarrayEx.txt
            cat out.txt
        fi
fi


#if [[ -f student-submission/FileExample.java ]]
 #   then
  #      javac -cp $CPATH student-submission/FileExample.java FileTest.java
   #     echo "The exist code of javac is $?"
    #    echo ""
     #   if [[ $? == 0 ]]
      #      then
       #     echo "FileExample.java compiled successfully!"
        #    echo "grade on FileExample.java: 100%"
        #else
         #   echo "FileExample.java compiled error!"
          #  set -e
           # java -cp FileTest > outarrayEx.txt
            #cat out.txt
        #fi
#fi

#if [[ -f student-submission/LinkedListExample.java ]]
 #   then
  #      javac -cp $CPATH student-submission/LinkedListExample.java TestLinkedListExample.java
   #     echo "The exist code of javac is $?"
    #    echo ""
     #   if [[ $? == 0 ]]
      #      then
       #     echo "LinkedListExample.java compiled successfully!"
        #    echo "grade on FileExample.java: 100%"
        #else
         #   echo "LinkedListExample.java compiled error!"
          #  set -e
           # java -cp TestLinkedListExample > outarrayEx.txt
            #cat out.txt
        #fi
#fi


