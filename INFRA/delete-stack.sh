echo "Deleting cloudformation stack"

aws cloudformation delete-stack \
--stack-name $1 $2