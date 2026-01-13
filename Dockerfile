FROM snakemake/snakemake:v9.9.0

WORKDIR /ListPred

COPY . /ListPred

RUN rm -rf .git/ && \
    cd / && \
    mkdir output && \
    cd /ListPred && \
    rm data/testset_input/*.gz && \
    snakemake --cores 1 --use-conda --config ind="data/testset_input/" outd="../test_out" && \
    rm -rf /test_out

ENTRYPOINT ["snakemake", "--use-conda", "-s", "/ListPred/workflow/Snakefile"]
