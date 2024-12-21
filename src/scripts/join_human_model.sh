
DATASETS=("popq" "awa" "nlpos" "sbic" "mhsc")
MODELS=("gpt" "gemini" "solar")

for i in "${!DATASETS[@]}"; do
    DATASET="${DATASETS[$i]}"

    for MODEL in "${MODELS[@]}"; do
        HUMAN_GROUND_TRUTH="../../data/human/ground_truth/${DATASET}_gt.csv"
        MODELS_RESULTS="../../data/model/processed/${DATASET}_${MODEL}.csv"
        OUTPUT_FILE="../../data/joint_final/${DATASET}_human_${MODEL}.csv"

        echo "Running join_human_model.py for dataset: $DATASET and model: $MODEL"
        python3 ../data/join_human_model.py --human_ground_truth $HUMAN_GROUND_TRUTH --model_results $MODELS_RESULTS --output_file $OUTPUT_FILE

        sleep 2
    done
done