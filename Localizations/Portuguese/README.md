Índice
=================

* [Inicialização](#inicialização)
* [Adicionar através de Cocoapods](#adicionar-através-de-cocoapods)
* [Adicionar SDK manualmente](#adicionar-sdk-manualmente)
* [Banners padrão](#banners-padrão)
* [Intersticiais](#intersticiais)
* [Anúncios de vídeo](#anúncios-de-vídeo)
* [Anúncios nativos](#anúncios-nativos)
* [Controle da localização](#controle-da-localização)
* [Outro](#outro)


Inicialização
==============

O Ampiri iOS SDK suporta o iOS 7.0 ou superior.
Pode-se adicionar o AmpiriSDK ao seu projeto utilizando [Cocoapods](http://cocoapods.org) (recomendado) ou manualmente.

Adicionar através de Cocoapods
========================

1. Se pretende ter pods no seu projeto, deve-se configurá-los utilizando o [Guia de iniciação](https://guides.cocoapods.org/using/getting-started.html)
2. Se pretende utilizar o Ampiri SDK com todas as redes de anúncios mediadas, adicione
`pod 'ampiri-ios-sdk'` ao seu Podfile
3. Se pretende utilizar o Ampiri SDK com redes mediadas de servidor, adicione apenas `pod 'ampiri-ios-sdk/Core` ao seu Podfile
4. Se pretende utilizar alguns adaptadores de rede do cliente, adicione estes ao seu Podfile.

Os adaptadores irão adicionar automaticamente as suas bibliotecas dependentes.
- `ampiri-ios- sdk/Adapters/FBAudienceAdapter` - adaptador para [Facebook Audience](https://developers.facebook.com/docs/ios)
- `ampiri-ios- sdk/Adapters/GoogleMobileAdsAdapter` - adaptador para [Google Mobile Ads SDK](https://developers.google.com/admob/ios/download)
- `ampiri-ios- sdk/Adapters/MopubAdapter` - adaptador para [MoPub](https://github.com/mopub/mopub-ios- sdk)
- `ampiri-ios- sdk/Adapters/ChartboostAdapter` - adaptador para [Chartboost](http://cboo.st/ios_v6-3)
- `ampiri-ios- sdk/Adapters/NativeXAdapter` - adaptador para [NativeX](https://github.com/nativex/NativeX-iOS- SDK)
- `ampiri-ios- sdk/Adapters/UnityAdsAdapter` - adaptador para [UnityAds(Applifier)](https://github.com/Applifier/unity-ads- sdk)
- `ampiri-ios- sdk/Adapters/VungleAdapter` - adaptador para [Vungle](https://v.vungle.com/sdk)
- `ampiri-ios- sdk/Adapters/AdColonyAdapter` - adaptador para [AdColony](https://github.com/AdColony/AdColony-iOS- SDK)
- `ampiri-ios- sdk/Adapters/AppLovinAdapter` - adaptador para [AppLovin](https://www.applovin.com/)

Adding SDK manually
===================

### **1.** Adicionar os arquivos SDK ao seu projeto (necessário)
Adicione Ampiri.framework ao seu projeto.

### **2.** Adicionar as bibliotecas externas (recomendado)
Para visualizar os anúncios de banner **padrão** das redes mediadas no cliente na sua
aplicação, deve-se adicionar:

* Biblioteca [Google Mobile Ads SDK](https://developers.google.com/admob/ios/download)
* Biblioteca [MoPub](https://github.com/mopub/mopub-ios- sdk)
* Biblioteca [Facebook Audience](https://developers.facebook.com/docs/ios)

Para visualizar os anúncios **intersticiais** das redes mediadas no cliente na sua aplicação,
deve-se adicionar:

* Biblioteca [Google Mobile Ads SDK](https://developers.google.com/admob/ios/download)
* Biblioteca [Chartboost](http://cboo.st/ios_v6-3)
* Biblioteca [Facebook Audience](https://developers.facebook.com/docs/ios)
* Biblioteca [MoPub](https://github.com/mopub/mopub-ios- sdk)
* Biblioteca [NativeX](https://github.com/nativex/NativeX-iOS- SDK)
* Biblioteca [AppLovin](https://www.applovin.com/)

Para visualizar os anúncios **vídeo** das redes mediadas no cliente na sua aplicação,
deve-se adicionar:

* Biblioteca [AdColony](https://github.com/AdColony/AdColony-iOS- SDK)
* Biblioteca [Unity Ads(Applifier)](https://github.com/Applifier/unity-ads- sdk)
* Biblioteca [Chartboost](http://cboo.st/ios_v6-3)
* Biblioteca [NativeX](https://github.com/nativex/NativeX-iOS- SDK)
* Biblioteca [Vungle](https://v.vungle.com/sdk)

Para visualizar os anúncios **nativo** das redes mediadas no cliente na sua aplicação,
deve-se adicionar:

* Biblioteca [Google Mobile Ads SDK](https://developers.google.com/admob/ios/download)
* Biblioteca [Facebook Audience](https://developers.facebook.com/docs/ios)
* Biblioteca [MoPub](https://github.com/mopub/mopub-ios- sdk)
* Biblioteca [AppLovin](https://www.applovin.com/)

**Nota: Para utilizar o AppLovin deve-se adicionar a sua AppLovinSdkKey à app Info.plist, que
poderá ser criada [aqui](http://applovin.com/developers):**

```xml
<key>AppLovinSdkKey</key>
<string>12345QWERTY_asdfg-09876_12345QWERTY_asdfg-09876_12345QWERTY_asdfg-09876_12345QWERTY_asdfg</string>
```

**Aviso: O Ampiri SDK 3.1.0 foi desenvolvido e verificado para funcionar corretamente com
as seguintes versões de redes SDK de anúncios de terceiros:**

* AdColony – 2.6.1
* Chartboost – 6.4.4
* Google Mobile Ads – 7.8.1
* NativeX – 5.5.6.3
* Unity Ads – 1.5.6
* Vungle – 3.2.0.1
* Facebook Audience – 4.12.0
* MoPub – 4.6.0
* AppLovin – 3.1

Não garantimos um comportamento estável e correto do Ampiri SDK se forem adicionadas
manualmente outras versões de SDKs da rede de anúncios.

### **3.** Adicione os adaptadores externos SDK ao seu projeto

Para cada rede de anúncios externa adicionada a partir da secção anterior, deve-se adicionar
o adaptador SDK para esta rede a partir da pasta de Adaptadores. Adicione apenas o
adaptador necessário para o projeto

### **4.** Configurar redes externas

Configure cada rede externa adicionada no site do Ampiri, caso contrário, estas não
serão utilizadas para visualização dos anúncios.

### **5.** Adicione a indicação `-ObjC` às configurações do projeto (Outra propriedade Linker Flags)

### **6.** Bibliotecas do sistema necessárias

O SDK com adaptadores utiliza as seguintes estruturas e bibliotecas do sistema. Adicione ao seu projeto quando usar o SDK manualmente (não através do Cocoapods).

**Aviso: Algumas versões Xcode suportam novas configurações apenas após o reinício do
Xcode, após limpar a memória Xcode e outros problemas.**

O QUE FAZER se tiver algum problema de ligação:

- Limpar o Build
- Reiniciar o Xcode
- Apagar a sua pasta DerivedData em `~/Library/Developer/Xcode/DerivedData`
- Apagar os conteúdos (não a pasta completa) de /var/folders
- Reiniciar o computador

### **7.** Configurações ATS no iOS 9.0

Como o Ampiri SDK utiliza redes de terceiros para carregar os anúncios e como nós não
podemos controlar se essas redes carregam o seu conteúdo através de https, deve-se
desativar o ATS da sua aplicação para garantir o comportamento correto do Ampiri SDK.
Para desativar o ATS adicionar as seguintes configurações à sua aplicação Info.plist file :

```
<key>NSAppTransportSecurity</key>
<dict>
    <key>NSAllowsArbitraryLoads</key><true/>
</dict>
```


Banners padrão
================

ID do espaço publicitário para teste (PADRÃO): `"00000000-0000- 0000-0000-000000000003"`
Tamanhos disponíveis de banner:

- 320x50 (recomendado)
- 728x90

Utilizar os seguintes métodos na sua subclasse UIViewController:

```objective-c
- (AMPBannerView *)loadBannerWithSize:(CGSize)size
                           identifier:(NSString *)identifier
                              success:(void (^)(AMPBannerView *banner))success
                              failure:(void (^)(AMPError *error))failure;
```
```
- (AMPBannerView *)loadBannerWithSize:(CGSize)size
                             location:(CLLocation *)location
                           identifier:(NSString *)identifier
                              success:(void (^)(AMPBannerView *banner))success
                              failure:(void (^)(AMPError *error))failure;
```

Por exemplo:

```objective-c
#import <AmpiriSDK/AmpiriSDK.h>

[self.bannerView stop];
self.bannerView = [[AmpiriSDK sharedSDK] loadBannerWithSize:AMP_BANNER_SIZE_320x50
                                                 identifier:@"00000000-0000-0000-0000-000000000003"
                                                    success:nil
                                                    failure:nil];


[self.view addSubview:self.bannerView];
```


Adicionar o seguinte código para os métodos `"viewDidAppear"` e `"viewWillDisappear"`:

```objective-c
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.bannerView resumeAutoUpdate];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.bannerView pauseAutoUpdate];
}
```

Se pretende desativar a atualização automática do banner:
```objective-c
self.bannerView.autoUpdate = NO;
```
Se pretende parar e eliminar o banner da tela:

```objective-c
[self.bannerView stop];
```

### Manuseamento de eventos de banner padrão

Para processar os eventos de banner, deve-se implementar blocos ou subscrever as notificações:

| Método | Descrição |
|:-----------------------------------------------------------------------|:-------------------------------------------------------------------------|
|` (void (^)(AMPBannerView *banner))success `| Ativado após o banner ser enviado com sucesso. |
|` (void (^)(AMPError *error))failure `| Ativado se o banner não tiver sido transferido.|
|` kAMPNotification_BannerClicked `| Ativado após clicar no banner. Após este evento, a app será minimizada e será aberto um navegador externo.|

Intersticiais
=============

ID do espaço publicitário para teste (FULLSCREEN): `"00000000-0000- 0000-0000-000000000002"`
O tamanho do banner é definido automaticamente, dependendo do tamanho da tela.
Utilizar os métodos seguintes na sua subclasse UIViewController:

```objective-c
- (void)loadFullscreenWithIdentifier:(NSString *)identifier
                             options:(AMPFullscreenLoadOptions)options
                   forViewController:(UIViewController *)viewController
                             success:(void (^)(AMPFullscreenBannerController *fullscreenController))success
                             failure:(void (^)(AMPError *error))failure;


- (void)loadFullscreenWithIdentifier:(NSString *)identifier
                            location:(CLLocation *)location
                             options:(AMPFullscreenLoadOptions)options
                   forViewController:(UIViewController *)viewController
                             success:(void (^)(AMPFullscreenBannerController *fullscreenController))success
                             failure:(void (^)(AMPError *error))failure;
```


Para banners em tela cheia, estão disponíveis 3 opções de apresentação:
```objective-c
typedef NS_ENUM(NSInteger, AMPFullscreenLoadOptions)
{
    AMPFullscreenLoadOptionsDefault = 0,
    AMPFullscreenLoadOptionsShowAfterLoad,
    AMPFullscreenLoadOptionsShowAfterLoadWithDelay
};
```

A opção padrão é ativar o banner e ativar o bloco de sucesso se o banner for carregado.
Pode-se mostrar de imediato o banner a partir deste bloco. A opção `ShowAfterLoad` carrega
o banner, mostra-o de imediato e ativa o bloco de sucesso. A partir do bloco de sucesso,
é possível guardá-lo na sua propriedade de subclasse UIViewController ou não fazer nada. A
opção `ShowAfterLoadWithDelay` carrega o banner, ativa o bloco de sucesso e mostra-o
após um atraso, que é recebido do servidor. A partir do bloco de sucesso, pode-se guardá-lo
na sua propriedade de subclasse UIViewController, mostrá-lo de imediato ou não fazer nada.

**Nota: Se o atraso não for especificado, o intersticial será mostrado de imediato após ter
terminado o carregamento.**

Por exemplo:
```objective-c
#import <AmpiriSDK/AmpiriSDK.h>

@weakify(self); // libextobjc lib

[[AmpiriSDK sharedSDK] loadFullscreenWithIdentifier:@"00000000-0000-0000-0000-000000000002"
                                            options:AMPFullscreenLoadOptionsDefault
                                  forViewController:self
                                            success:^(AMPFullscreenBannerController *fullscreenController) {
                                                @strongify(self);// libextobjc lib
                                                self.fullscreenController = fullscreenController;
                                          } failure:nil];
```

### Manuseamento de eventos intersticiais

Para processar os eventos intersticiais, deve-se implementar os blocos ou subscrever as
notificações. Estão disponíveis os seguintes:

| Método | Descrição |
|:-----------------------------------------------------------------------|:-------------------------------------------------------------------------|
|`(void (^)(AMPFullscreenBannerController *fullscreenController))success `| Ativado após ter sido transferido o banner em tela cheia. Após ser ativado este método, o banner está pronto a ser visualizado.|
|`(void (^)(AMPError *error))failure `| Ativado se o banner em tela cheia não tiver sido transferido.|
|`kAMPNotification_FullscreenControllerClicked `| Ativado após clicar no banner em tela cheia. Após este evento, a app será minimizada e será aberto um navegador externo.|
|`kAMPNotification_FullscreenControllerDidHide `| Ativado após o banner em tela cheia desaparecer da tela.|
|`kAMPNotification_FullscreenControllerDidShow `| Ativado após ter sido visualizado o banner em tela cheia.|
|`kAMPNotification_FullscreenControllerWillHide `| Ativado após pressionar a tecla "fechar", mesmo antes de desaparecer o banner em tela cheia.|
|`kAMPNotification_FullscreenControllerWillLoad `| Ativado antes de enviar o pedido do banner em tela cheia ao servidor.|
|`kAMPNotification_FullscreenControllerWillShow `| Ativado antes de visualizar o banner em tela cheia.|

Anúncios de vídeo
=========

ID do espaço publicitário em vídeo para teste (VIDEO): `"00000000-0000- 0000-0000-000000000006"`

Utilizar os seguintes métodos na sua subclasse UIViewController:
```objective-c
- (void)loadVideoWithIdentifier:(NSString *)identifier
                        success:(void (^)(AMPVideoController *videoController))success
                        failure:(void (^)(AMPError *error))failure;

- (void)loadVideoWithIdentifier:(NSString *)identifier
                       location:(CLLocation *)location
                        success:(void (^)(AMPVideoController *videoController))success
                        failure:(void (^)(AMPError *error))failure;
```
Por exemplo:
```objective-c
#import <AmpiriSDK/AmpiriSDK.h>

@weakify(self); // libextobjc lib

[[AmpiriSDK sharedSDK] loadVideoWithIdentifier:@"00000000-0000-0000-0000-000000000006"
                                       success:^(AMPVideoController *videoController) {
                                            @strongify(self); // libextobjc lib
                                            self.videoController = videoController;
                                     } failure:nil];
```
### Manuseamento de eventos de vídeo

Para processar eventos de anúncios em vídeo, deve-se implementar os blocos ou subscrever
as notificações. Está disponível o seguinte:

| Método | Descrição |
|:-----------------------------------------------------------------------|:-------------------------------------------------------------------------|
|`(void (^)(AMPVideoController *videoController))success `| Ativado após o vídeo ter sido transferido. Após ser ativado este método, o anúncio em vídeo está pronto para ser visualizado. |
|`(void (^)(AMPError *error))failure `| Ativado se o anúncio em vídeo não tiver sido transferido. |
|`kAMPNotification_VideoControllerWillShow `| Ativado quando o vídeo é mostrado (for mostrado). |
|`kAMPNotification_VideoControllerDidShow `| Ativado quando o vídeo não foi mostrado (é mostrado). |
|`kAMPNotification_VideoControllerWillHide `| Ativado quando o vídeo for ocultado (for fechado). |
|`kAMPNotification_VideoControllerDidHide `| Ativado quando o vídeo foi ocultado (é fechado). |
|`kAMPNotification_VideoControllerStarted `| Ativado quando o vídeo é iniciado. |
|`kAMPNotification_VideoControllerPause `| Ativado quando o vídeo é interrompido (ainda não implementado). |
|`kAMPNotification_VideoControllerResume `| Ativado quando o vídeo é retomado (ainda não implementado). |
|`kAMPNotification_VideoControllerCompleted `| Ativado quando a visualização do vídeo é concluída. |
|`kAMPNotification_VideoControllerWillLoad `| Ativado antes de enviar o pedido de vídeo ao servidor. |
|`kAMPNotification_VideoControllerClicked `| Ativado após clicar no vídeo. Após este evento, a app será minimizada e será aberto um navegador externo. |

Anúncios nativos
==========

ID do espaço publicitário para teste (Anúncio nativo): `"00000000-0000- 0000-0000-000000000008"`

Um anúncio nativo é uma representação em bruto de um anúncio sem qualquer conjunto de UI
pré-definido, que permite aos promotores a liberdade de projetar e controlar o anúncio.
A disposição de um anúncio nativo é configurada por promotores com a ajuda do Interface
Builder (making .xib file) ou da criação manual de controles UI codificados.
Utilizar os seguintes métodos na sua subclasse UIViewController:

```objective-c
- (void)loadNativeAdWithIdentifier:(NSString *)identifier
              parentViewController:(UIViewController *)viewController
           adViewClassForRendering:(Class)adViewClass
                           success:(void (^)(UIView *adNativeViewContainer))success
                           failure:(void (^)(AMPError *error))failure;
```

O método seguinte realiza a transferência assíncrona dos anúncios nativos com todos os
recursos ligados e transmite em seguida as informações do anúncio aos controles de UI ligados.

Existe um algoritmo comum que pode ser utilizado quando implementar um anúncio nativo:

1) Crie a sua própria subclasse de `AMPNative` com qualquer nome (`MyNativeBannerView`
por exemplo)

2) Selecione uma das duas opções:

a) Opção XIB – Definir a configuração do `MyNativeBannerView` num arquivo XIB em
separado. O promotor deve-se ligar os controles UI pretendidos neste XIB e as propriedades
de `<AMPNativeViewInterface>`, que o `AMPNativeView` adota. A implementação da classe
`MyNativeBannerView` deve ser sobrescrita `+ (NSString *)xibName`, que retorna
ao nome do mesmo XIB.

b) Opção de codificação – A implementação da classe `MyNativeBannerView` deve ser efetuada através da criação e colocação dos controles UI utilizando `<AMPNativeViewInterface>`, que o `AMPNativeView` adota

3) Ative loadNativeAdWithSize com os parâmetros necessários, onde o identificador é a sua
ID privada do espaço publicitário e className é o nome da classe `MyNativeBannerView`.
Após transferir as informações do anúncio, o SDK inicia um exemplo da classe
`MyNativeBannerView` criada no passo 2 . Em seguida, o SDK envia as informações do
anúncio nativo nos controles ligados a este exemplo. Nem todos os controles são
preenchidos desta forma, apenas os principais: `mtTitleTextLabel, mtMainTextLabel,
mtIconImageView, mtMainImageView`. Quando a transmissão estiver terminada, será
ativado o bloco de conclusão bem-sucedida com este exemplo.

4) Transmita os outros controles, como `mtRatingView`, num espaço de visualização do anúncio.

**Nota: A classe de propriedade *nativeAd* de *MyNativeBannerView* pode estar vazia e
você não conseguirá obter informações do anúncio para uma transmissão extra**.

5) Mostrar o espaço de visualização do anúncio na tela.

6) Registrar o espaço de visualização do anúncio para manuseamento tátil.

Por exemplo:

```objective-c
#import <AmpiriSDK/AmpiriSDK.h>

__weak typeof(self) weakSelf = self;
[[AmpiriSDK sharedSDK] loadNativeAdWithIdentifier:@"00000000-0000-0000-0000-000000000008" 
                             parentViewController:self
                                classForRendering:NSStringFromClass([MyNativeBannerView class])
                                          success:^(UIView *adNativeViewContainer) {
                                            UIView *nativeView = adNativeViewContainer;
                                            nativeView.frame = weakSelf.adContainerView.bounds;
                                            [weakSelf.adContainerView addSubview:nativeView];
                                            [nativeView registerViewControllerForInteraction:weakSelf];
                                        } failure:^(NSError *error) {
}];
```


Controle da localização
================

ID do espaço publicitário para teste (similar ao anúncio nativo): `"00000000-0000- 0000-0000-000000000008"`

O controle de localização é uma tecnologia inteligente para adicionar os anúncios nativos às
suas transmissões com base em *UITableView* ou *UICollectionView*. As configurações
para o controle da localização são recebidas do servidor e poderá alterá-las conforme
pretendido.

Para uma integração mais simples, pode-se utilizar os nossos modelos personalizados: *in-Feed* e *Content Stream* com base em `AMPNativeAdsTemplateType`:
```objective-c
- (AMPTableViewStreamAdapter *)addLocationControlToTableView:(UITableView *)tableView
                                        parentViewController:(UIViewController *)viewController
                                                  identifier:(NSString *)identifier
                                                templateType:(AMPNativeAdsTemplateType)templateType
                                       templateCustomization:(void (^)(AMPTemplateCustomizationObject *templateCustomizationObject))templateCustomization;

- (AMPCollectionViewStreamAdapter *)addLocationControlToCollectionView:(UICollectionView *)collectionView
                                                  parentViewController:(UIViewController *)viewController
                                                            identifier:(NSString *)identifier
                                                    useDefaultGridMode:(BOOL)gridMode
                                                          templateType:(AMPNativeAdsTemplateType)templateType
                                                 templateCustomization:(void (^)(AMPTemplateCustomizationObject *templateCustomizationObject))templateCustomization;                                       
```

Lista de personalizações:

| Propriedade de AMPTemplateCustomizationObject | Descrição |
|:-----------------------------------------------------------------------|:-------------------------------------------------------------------------|
|`ampBackgroundColor `| cor das células do anúncio |
|`ampTitleFont `| fonte do label do título nas células do anúncio |
|`ampTitleColor `| cor do label do título nas células do anúncio |
|`ampDescriptionTextFont `| fonte do label de descrição nas células do anúncio |
|`ampDescriptionTextColor `| cor do label de descrição nas células do anúncio |
|`ampDescriptionTextLeftOffset `| desvio esquerdo para o label de descrição nas células do anúncio |
|`ampDescriptionTextRigthOffset `| desvio direito para o label de descrição nas células do anúncio |
|`ampCoverImageLeftOffset `| desvio esquerdo para visualização da imagem principal do anúncio|
|`ampCoverImageRightOffset `| desvio direito para visualização da imagem principal do anúncio |
|`ampCoverImageTopOffset `| desvio superior para visualização da imagem principal do anúncio |
|`ampCoverImageBottomOffset `| desvio inferior para visualização da imagem principal do anúncio |
|`ampCoverImageCornerRadius `| formato do canto da camada da imagem principal do anúncio |
|`ampCTAFont `| selecione para ativar a fonte do label |
|`ampCTAColor `| selecione para ativar a visualização da cor de fundo|
|`ampCTATextColor `| selecione para ativar a cor do texto do label|
|`ampCTABorderColor `| selecione para ativar a cor da borda da camada|
|`ampCTACornerRadius `| selecione para ativar o ângulo do canto da camada |
|`ampCTABorderWidth `| selecione para ativar a largura da borda da camada|
|`ampCTARightOffset `| desvio direito para ativar a visualização do anúncio|
|`ampCTABottomOffset `| desvio inferior para ativar a visualização do anúncio |
|`ampSponsoredFont `| fonte do label patrocinada |
|`ampSponsoredColor `| cor do texto do label patrocinada|
|`ampIconLeftOffset `| desvio esquerdo para visualização do ícone app do anúncio|
|`ampIconTopOffset `| desvio superior para visualização do ícone app do anúncio |
|`ampIconHeight `| altura para visualização do ícone app do anúncio |
|`ampIconWidth `| largura para visualização do ícone app do anúncio |
|`ampIconCornerRadius `| formato do canto da camada do ícone app do anúncio |
|`ampIconContentMode `| modo de conteúdo da visualização do ícone app do anúncio |

Se pretender utilizar a sua própria representação de um anúncio nativo, deve-se utilizar estes métodos:

```objective-c
- (AMPTableViewStreamAdapter *)addLocationControlToTableView:(UITableView *)tableView
                                        parentViewController:(UIViewController *)viewController
                                                  identifier:(NSString *)identifier
                                     adViewClassForRendering:(Class)adViewClass;

- (AMPCollectionViewStreamAdapter *)addLocationControlToCollectionView:(UICollectionView *)collectionView
                                                  parentViewController:(UIViewController *)viewController
                                                            identifier:(NSString *)identifier
                                                    useDefaultGridMode:(BOOL)gridMode
                                               adViewClassForRendering:(Class)adViewClass;                                      
```

Estes métodos funcionam da mesma forma que os [Anúncios nativos](#anúncios-nativos). É necessário
utilizar as instruções deste tipo de anúncio para configurar o campo `adViewClass` nos métodos.

Para o `UITableView` não precisa fazer nada nos métodos `UITableViewDelegate` e
`UITableViewDataSource` para adicionar os anúncios à sua transmissão, os anúncios nativos
serão adicionados automaticamente.

Para o `UICollectionView` deve-se escrever algum código nos métodos
`UICollectionViewDelegate` e `UICollectionViewDataSource` para adicionar os anúncios à sua
transmissão se utilizar apenas a disposição de vista de esquema personalizada, para o
`UICollectionViewFlowLayout` os anúncios nativos serão adicionados automaticamente:

```objective-c
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
                        if ([self.adapter shouldDisplayAdAtIndexPath:indexPath]) {
                            YourAdContainerCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([YourAdContainerCollectionViewCell class])
                            forIndexPath:indexPath];
                            cell.layer.zPosition = 1000;
                            return [self.adapter adRenderedAdCellAtIndexPath:indexPath inCell:cell];
                        } else {
                            //your feed cell
                        }
}
```

**Nota: Se pretende conhecer o caminho original do índice de uma célula na sua
transmissão sem os anúncios utilizarem este método (pode ser importante carregar as
informações a partir da sua sequência de dados):**

```objective-c
- (NSIndexPath *)originalIndexPath:(NSIndexPath *)indexPath;
```

Outro
=====

### Versão do SDK

```objective-c
NSString *version = [AmpiriSDK version];
```

### Modo de teste (modo de desenvolvimento)

Durante a fase de desenvolvimento, recomendamos configurar o testMode para `YES` para
evitar gerar impressões falsas e analisar os cliques. A configuração por padrão é `NO`.

```objective-c
[AmpiriSDK setTestMode:YES];
```

### Informações do utilizador

Para incluir as informações do utilizador no SDK, deve-se configurar as seguintes propriedades:

```objective-c
// age can not be more than 100 and less than 1
+ (void)setAge:(NSUInteger)userAge;//save age in the current app life cycle only

+ (void)setAge:(NSUInteger)userAge saveInUserDefaults:(BOOL)shouldSave;

// this method set age too
+ (void)setBirthday:(NSDate *)birthday;//save birthday in the current app life cycle only
+ (void)setBirthday:(NSDate *)birthday saveInUserDefaults:(BOOL)shouldSave;

+ (void)setGender:(AMPUserGender)userGender;//save gender in the current app life cycle only
+ (void)setGender:(AMPUserGender)userGender saveInUserDefaults:(BOOL)shouldSave;

// array should contains strings only
+ (void)setInterests:(NSArray *)interests;//save interests in the current app life cycle only
+ (void)setInterests:(NSArray *)interests saveInUserDefaults:(BOOL)shouldSave;

+ (void)resetUserData;
```

Por exemplo:

```objective-c
#import <AmpiriSDK/AmpiriSDK.h>

//remove all user data from everywhere
[AmpiriSDK recetUserData];

[AmpiriSDK setGender:AMPUserGenderMale];
//Or if you want to save gender data in NSUserDefaults
//[AmpiriSDK setGender:AMPUserGenderMale saveInUserDefaults:YES];


[AmpiriSDK setAge:25];
//Or if you want to save age data in NSUserDefaults
//[AmpiriSDK setAge:25 saveInUserDefaults:YES];

// this method set age too
[AmpiriSDK setBirthday:[NSDate date]];
//Or if you want to save age data in NSUserDefaults
//[AmpiriSDK setBirthday:[NSDate date] saveInUserDefaults:YES];

[AmpiriSDK setInterests:@[@"Ampiri", @"coding", @"iOS", @"to be superman"]];
//Or if you want to save interests data in NSUserDefaults
//[AmpiriSDK setInterests:@[@"Ampiri", @"coding", @"iOS", @"to be superman"] saveInUserDefaults:YES];
```
