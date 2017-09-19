

# iDeepVision - Deep Learning embarcada — e em tempo real — no seu iPhone   ( [![iDeepVision](http://i.imgur.com/kMmUwVU.png)](https://www.linkedin.com/in/joaogabriellima/) )

###### [Artigo completo no @Medium](https://medium.com/@joaogabriellima/coreml-deep-learning-embarcada-e-em-tempo-real-no-seu-iphone-ebed77d79a79)


Atenção: você precisará do iOS 11. Instruções de como atualizar podem ser encontradas aqui: https://www.igeeksblog.com/how-to-install-ios-11-beta-on-iphone-ipad/

Este repositorio contém o condigo-fonte completo do projeto showcase chamado iDeepVision, que visa mostrar como utilizar o framework CoreML para a execu'ç˜çã de modelos comptacionais de Machine Learning a partir do iOS 11.
![](https://cdn-images-1.medium.com/max/1600/1*1PFTvixoQMqXoXMXtgXYPw.png)
# Modelo suportados:

  - [InceptionV3](https://arxiv.org/abs/1512.00567) - *Rethinking the Inception Architecture for Computer Vision*
  - [MobileNet](https://arxiv.org/pdf/1704.04861.pdf) - *MobileNets: Efficient Convolutional Neural Networks for Mobile Vision Applications*
  - [ResNet50](https://arxiv.org/pdf/1512.03385.pdf) - *Deep Residual Learning for Image Recognition*
  - [VGG16](https://arxiv.org/pdf/1409.1556.pdf) - *Very Deep Convolutional Networks for Large-scale Image Recognition*
  - [SqueezeNet](https://arxiv.org/pdf/1602.07360.pdf) - *SqueezeNet: Alexnet-level accuracy with 50X Fewer Parameters and <0.5MB Model Size*

### Como fazer download dos modelos
Como você pode observar, o projeto não possui a pasta models/ com os modelos descritos acima, isto foi apara economizar espaço no repositório e faciliar o acesso ao código-fonte. Voc6e pode baixar a pasta com todos os modelos em: [Download modelos](https://goo.gl/4WUqhy) 

Caso voc6e queira baixar diretamente da Apple, seguem abaixo os links:

| Plugin | README |
| ------ | ------ |
| MobileNet | [https://docs-assets.developer.apple.com/coreml/models/MobileNet.mlmodel] [PlDb] |
| SqueezeNet | [https://docs-assets.developer.apple.com/coreml/models/SqueezeNet.mlmode] [PlGh] |
| Resnet50 | [https://docs-assets.developer.apple.com/coreml/models/Resnet50.mlmodel] [PlGd] |
| InceptionV3 | [https://docs-assets.developer.apple.com/coreml/models/Inceptionv3.mlmodel] [PlOd] |
| VGG16 | [https://docs-assets.developer.apple.com/coreml/models/VGG16.mlmodel] [PlMe] |
  
Após baixar, você adiciona cria uma pasta chamada 'models' e execute o projeto.
