MODEL_NAME="nsfw_image_detection"
HF_REPO="./${MODEL_NAME}"
ONNX_MODEL="${MODEL_NAME}_onnx"
QUANTIZED_MODEL="quantized_${ONNX_MODEL}"

pip install optimum[exporters,onnxruntime]==1.15
optimum-cli export onnx -m $HF_REPO --optimize O2 $ONNX_MODEL --framework pt --task "image-classification"
optimum-cli onnxruntime quantize --avx512 --onnx_model $ONNX_MODEL -o $QUANTIZED_MODEL
mkdir ${QUANTIZED_MODEL}/onnx
mv ${QUANTIZED_MODEL}/model_quantized.onnx ${QUANTIZED_MODEL}/onnx/model_quantized.onnx