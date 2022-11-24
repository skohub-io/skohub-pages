while getopts f:s:l: flag
do
    case "${flag}" in
        f) file=${OPTARG};;
        s) shape=${OPTARG};;
        l) severity=${OPTARG};; # not used right now
    esac
done

# fail if any other exit status than 0
set -e

# download skos shacl shape
curl https://raw.githubusercontent.com/skohub-io/shapes/main/skos.shacl.ttl --output skos.shacl.ttl

# check file is not empty
test $(wc -l $file | awk '{print $1}') -gt 0 || (echo "file has no lines, aborting"; exit 1)

echo "Validate: docker run --rm -v $(pwd)/skos.shacl.ttl:/rdf/shape.ttl -v $(pwd)/$file:/rdf/file.ttl laocoon667/jena:4.6.1 shacl v -s /rdf/shape.ttl -d /rdf/file.ttl > result.ttl"
docker run --rm -v $(pwd)/skos.shacl.ttl:/rdf/shape.ttl -v $(pwd)/$file:/rdf/file.ttl laocoon667/jena:4.6.1 shacl v -s /rdf/shape.ttl -d /rdf/file.ttl > result.ttl

# Parse the validation to check for errors
echo "Parse Validation: docker run --rm -v $(pwd)/scripts/check-for-violation.rq:/rdf/check-for-violation.rq -v $(pwd)/result.ttl:/rdf/result.ttl laocoon667/jena:4.6.1 arq --data /rdf/result.ttl --query /rdf/check-for-violation.rq"
validationResult="$(docker run --rm -v $(pwd)/scripts/check-for-violation.rq:/rdf/check-for-violation.rq -v $(pwd)/result.ttl:/rdf/result.ttl laocoon667/jena:4.6.1 arq --data /rdf/result.ttl --query /rdf/check-for-violation.rq)"

lines=$(echo "$validationResult" | wc -l )

# print validation result for informational purposes
echo "$validationResult"

# an empty result, i.e. a correct validation has 4 lines of output
test ${lines} -eq 4 || (echo "validation errors, check output"; exit 1)

# remove created files
rm result.ttl skos.shacl.ttl