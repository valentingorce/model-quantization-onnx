# Model Quantization with Optimum, onnx and onnx-runtime

Here is sample script to convert to **onnx** a vision transformer (vit) using [Optimum](https://huggingface.co/docs/optimum/index).  
Here we use O2 quantization and get a onnx-runtime model, compatible for [Transformers.js](https://huggingface.co/docs/transformers.js/index).  

> From my experience, it does not always run smoothly... I sometimes needed to try several versions of optimum or onnx.

In this example I use [nsfw_image_detection](https://huggingface.co/Falconsai/nsfw_image_detection), which I previously cloned from source (I encountered issues while providing the model id directly...).

It should create a **quantized_nsfw_image_detection_onnx** directory with the right format to be used with Transformers.js.

> Be careful with the version of Opset, as Opset 19 isn't supported yet.