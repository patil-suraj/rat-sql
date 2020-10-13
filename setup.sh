# Install python3.7
apt-get update && apt-get install python3.7 python3.7-dev python3-pip

# Install the repo
python3.7 -m pip install -r requirements.txt
python3.7 -m pip install entmax
python3.7 -c "import nltk; nltk.download('stopwords'); nltk.download('punkt')"

# Cache BERT models
python3.7 -c "from transformers import BertModel; BertModel.from_pretrained('bert-large-uncased-whole-word-masking')"

# Download & cache StanfordNLP
mkdir -p third_party && \
  cd third_party && \
  curl https://nlp.stanford.edu/software/stanford-corenlp-full-2018-10-05.zip | jar xv \

# WikiSQL deps
git clone https://github.com/salesforce/WikiSQL third_party/wikisql

# Download spider data
gdown "https://drive.google.com/uc?export=download&id=1_AckYkinAnhqmRQtGsQgUKAnTHxxX5J0"
unzip -q spider.zip
mkdir -p data && mv spider data/