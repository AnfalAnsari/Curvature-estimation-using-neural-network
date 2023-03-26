function [Y,Xf,Af] = NNCircle2(X,~,~)
%NNCIRCLE2 neural network simulation function.
%
% Auto-generated by MATLAB, 09-Jan-2023 22:23:05.
% 
% [Y] = NNCircle2(X,~,~) takes these arguments:
% 
%   X = 1xTS cell, 1 inputs over TS timesteps
%   Each X{1,ts} = 9xQ matrix, input #1 at timestep ts.
% 
% and returns:
%   Y = 1xTS cell of 1 outputs over TS timesteps.
%   Each Y{1,ts} = 1xQ matrix, output #1 at timestep ts.
% 
% where Q is number of samples (or series) and TS is the number of timesteps.

%#ok<*RPMT0>

% ===== NEURAL NETWORK CONSTANTS =====

% Input 1
x1_step1.xoffset = [-3.6e-11;-4e-11;-4e-11;-4e-11;-4e-11;-4e-11;-1.4e-11;-3.6e-11;0];
x1_step1.gain = [1.999999999872;1.99999999992;1.99999999992;1.999999999864;1.999999999864;1.99999999984;1.999999999972;1.999999999848;2];
x1_step1.ymin = -1;

% Layer 1
b1 = [-2.1961842021970334748;-2.6127895539496424071;2.3098022378448517244;-1.9914371681203335562;-1.4548190761064450083;1.814296121638166559;2.2889669030821022666;-3.8164217984665094185;-2.4959959031442262578;-2.6630167228228565079;1.9783395885854275775;-1.8111955761834352963;-1.7139466504452216533;1.537576493396800581;-1.6599635226401268095;2.0332765742070870729;2.4792060914873816913;-1.2865139254232489385;-2.174549444824632527;-1.9646191146943696726;-2.0521370914161258803;2.0195297191958103689;-1.5126860894047640116;-2.4814878329553780034;-1.5892728162702156602;-0.77959213738898425206;-2.1615948596057235065;0.76653598922507792945;-0.41442635034636454705;1.058367916675052367;-1.8443243120427890158;1.5432059931682953202;0.68713111645734392674;1.3345427115378603045;1.0075163901292183422;-0.59824421538960237399;-2.1126996302449114751;0.14955574099341645278;0.32646340128059647689;-0.12962261108356992745;0.13858256751190090039;1.2454431312538847276;-0.44189961339933586659;-0.62502535694840399838;0.25202010114969153332;1.0178351881562530679;0.26230131976755621803;-0.27951347617868688156;0.46332817816343507822;0.35110920014532032152;-1.0369945294542397551;-0.086351221984019649325;-1.2846065228528964486;-0.56929102283592458722;0.11358505104156159382;0.14391594259566045655;0.76734821904877315024;-0.45327250240957489558;1.3805782246176878658;-0.60013441188150118411;1.0690050034958549219;-0.98201742889592824604;-0.50676921295596222272;0.44773664193737816586;1.3278097751112389879;0.40830651843840715109;1.7456179221259182643;-1.2587804281826959762;-0.94103340397859347455;-0.78189019970014783656;1.0342127551936868279;-1.0428928756069568706;1.1908392083105852066;-0.3471285866634565842;1.3017517671428080472;-2.0260613478834539336;-1.2038780779958984102;-1.491541330033330226;1.2052110698778324416;-1.2499012339391526449;-1.360334646348622778;1.6030997422173010047;2.2279480054073261819;2.1313045289178620401;1.152449492741637771;-2.8300122173808590631;1.1352006639446290404;2.8703303403474422772;-2.167106219233901232;1.8558064179130524529;-1.9778343216325389164;-2.8396650981292883564;2.2664128470752227251;2.0482712369747577696;2.7017823124097972709;-2.0143659150650337075;3.5503115847874315847;-3.1746979496998553039;-2.3331816513465768459;-3.0919583122804645825];
IW1_1 = [1.3064463746608112604 -0.47605648223454999357 0.10662094575602154567 -1.8519779592941709723 -0.2357439498839285219 0.043894412571262433898 1.2175948679316264123 -0.27842141353762017708 -0.048451989051882290993;1.192205473464776011 1.7907934711847648401 -0.68677644652128155833 0.46864960847559145041 -3.0026302770123058927 0.97601134005221912293 0.35133468337135170811 1.3228083668801258188 -0.36460160253337292602;-1.2850386260845010344 -1.0988786268317480843 0.67947830755385840718 -1.0257491512874450379 0.20302912133712394671 0.46589538046136808047 1.1636801207527729396 -1.2706376537390999815 1.0366500906377071889;0.74780238243748786697 0.93696118701850372723 0.34119278632484167924 -1.5257837382566732387 -1.153464065965195573 -0.3663710239060746221 1.7985063710115289926 -0.80383632442446817379 -0.54335279861995389172;0.66388065566413090313 -2.4175276640477010304 -0.33449535592729556788 -0.00021049675608989047021 1.4302942354800141089 -1.7657031830688532104 0.6428569746046700617 -1.8357492482981880855 -1.5804608600879135327;-0.59954271761097710502 0.23955796537603302188 0.78022915962132788348 -0.78102662128959476906 -0.66149810491278582258 -0.34164506839972241803 1.5208146427205837536 -0.93518104770851884222 0.00012039557474872140952;-1.1341693418859335463 0.31899452656141208395 0.75701203670301864257 0.39653165030764947474 0.62894607344569208873 1.3174237714638288299 1.1306382686151867922 0.45501251385555896434 -0.091151917045643016113;0.22318525939725419871 0.12743848719104547418 -0.76404128001684579186 1.5623426079743985007 -2.0617638900188879347 -2.3139267248609503014 0.66849338997844931498 -0.24107569941592896234 0.55779849108903434285;0.68957507965456488197 -0.48425447961297718447 -0.7711444164514130728 1.9477424772040758949 -1.7279306740290441002 -0.19076445322714147279 -2.5160128843833455825 2.4142110757303760771 1.3577759871937957747;1.1062098129160053972 1.4876449264024551589 -0.076681798785427690568 -1.6401253129393438268 -0.66783528699691208086 -0.3996001936687647027 0.86902587719922907983 -0.40565297715436415826 -0.020537950994360235774;-1.3640516753539859707 -0.10614579797433693065 -0.34163957249381438075 0.89853000873220190137 -0.76596344418076056648 -0.16779458041205064234 1.0731116140792855695 1.5643186589210515969 0.60185271535976381241;0.64664140668650127441 -2.0375242249346019463 -0.6613227226700796324 0.89987094414631241257 0.15457459903054951433 1.2071082052028325737 0.83204214757865846419 0.22396990103907127301 -0.36604042728236507731;1.259720371128540517 -0.041748459429557030487 0.17137631889983145905 -0.088417779309825556 -0.085602344188608445186 -0.49417305476577511048 0.69093607949252300315 1.698937681219559348 0.90620722489638805275;-0.44602944235661395878 1.8546762368682188082 0.062480951214366357849 0.35722589261348791645 0.67052109456500197382 0.78036214962237826498 1.0398454871552134104 1.0890163062365314506 1.6084118278841659233;0.75812960931742379156 -1.3941130452769130432 0.033203815449019284667 1.0336355010446780511 1.899494246457954949 0.7081814336782155106 0.79725637156652318094 0.47509017489739724383 1.0406258548658353646;-1.0738503069373572796 1.3765666333123329768 -0.018118650017809323494 -0.38454799476526335678 1.461487296051229734 1.4678326168308488686 -0.80480516354786757471 -0.11966095501125642575 -0.79065363841944957812;-1.0404580372039962111 1.129543038801705146 -1.6594959539810347771 -0.055679467291864521983 0.27282351040181240798 -1.130777017566826137 0.38268305250355239 -1.4957398662174523629 -0.6965292752605700688;0.83439836463459049476 2.389239270771778223 -0.99638884385457326953 1.0344985561752615411 -0.48679446833124195848 -1.3559804647715574255 0.25529447668840238306 1.2940414603221601642 -0.15798270913739018151;0.23726999889845179492 -1.8947916033899050436 -0.35285038724260209264 -1.7479819240941671943 -1.0905436708022078207 -1.6499386137689406873 0.37331837126700972984 1.7586094752845333744 0.70051907413198433172;0.70158872371926972455 0.58898586077865544564 -0.09894382531081064025 -1.0810113648582579948 0.37170475129074825871 -1.1777276612683602597 1.5641900993900410555 -1.7669046670610617511 0.69214660082230583527;-0.00069430644476897425757 -1.2288636294083750133 -0.36736566621475746919 -0.77123576174088970259 1.6429951963772384538 -1.2036986888160783327 1.4061683347461315652 -2.0348537683366303419 2.0811539540554675476;-0.78444303139606297304 0.76791165169885222674 1.7224558311905486807 -0.4072695322337395174 -0.51934255993406774898 -0.044108281417180220108 0.19631416972040938163 0.10526572981397018525 -0.2274205946499362474;-0.056676384536295740246 -1.1788008346778848789 -0.14015619111335908542 0.80285303502222737926 -0.63690592334650875106 -0.55592096238657995322 0.16843841729851033451 -1.2423000728638518009 -0.79226937440180256189;0.72341680614293879525 1.5983807124591049575 -0.84329474723616448806 1.3121700265406901487 -1.4890510103482299531 1.4980051073517366422 0.13949046000328457762 -0.22687695318834422142 -1.3610010182655203348;-0.47208096842793095815 1.3889287259535776364 0.68642451953818905963 -0.59900241928764552668 -1.2664453473409804651 0.68533223206743842937 -1.0678540280855604028 -0.34357925859003124458 0.41038261071826392934;1.282504596003998687 1.4169442910513427858 1.305587675179315621 -0.077016887557829163957 -1.4551941606547449393 0.41226395135696902727 0.35452304286079638906 -0.66186382569623758432 -1.1250271100762609944;0.095867360640648088821 -2.5380732366138674116 0.62945796557825162143 1.0093821477229070194 0.77166427993603259328 0.59258745488868302953 1.0701059315685212958 -1.0364911447972426917 -0.65014290969575649903;-0.47976237072078625756 0.33963502252789906644 -1.9109118753031828497 0.13610721448971541125 -0.4391011452725863129 1.1705591597687536876 1.0857685000085173233 1.2896972597921882997 -0.20087272640507061738;1.1652839465986966072 -1.384666448295442942 -0.48078648256993083976 0.80982510861538192781 -0.67331567681966053573 -0.072944818500761232638 1.0565077215434846014 -0.13686290511067808473 -0.32105008116278027641;-0.55152766402460673412 0.46084535943374715927 0.033741697594354524981 -0.35241502932446405749 0.90204816071209270589 -0.95411387488251053757 1.3066105247388244415 0.048692516348007905402 -0.18794141752181112159;0.39137309509699003129 -1.3641964489828302121 1.3486861136300289932 -0.94255913942133384698 1.2318670880671600543 -0.084034604081138539189 0.79280296415672779631 1.4826115632796219579 -0.26268623362228948892;-0.98210330801004197543 0.055299291924538820919 -0.20699076347975994827 -1.6051181484239089858 -0.96021804197406457337 -0.69914855016490962125 -0.13379298124962155092 -0.87942472954232275839 -1.2116958382483515866;-0.91428712378869703148 -0.37923838370083262639 0.69908869733504308552 -2.0532110025986129997 0.95090017903430745783 -0.92681989468817538302 1.1481408649951239109 0.50589117230344160525 0.95354074169835456587;-0.41224394680522585821 -1.697901068306990835 0.44571791256181619856 1.8764899490850768249 1.5578959269002075061 -0.4151615686953876172 0.36414135529319141549 1.0518097764015816864 -2.0446502195193199114;-1.1348065079746461059 -1.4212567970222318436 -0.22707695344420780748 -1.0600797242914519192 -0.63280038692183693261 1.6996456327967135458 -1.9047286888737444688 -0.44191702866453280718 -0.62486624477649199694;0.45351461239714807583 -1.0681847481539612499 -1.5860537747362202232 -1.2350954212829752255 0.69117753747958921018 -1.2531991761874190505 -1.1854680323475743631 -2.2350855750393194832 -1.1684059748617634522;0.55034595172450151424 0.70585763087005581884 -0.89022141838459889485 0.53125452017959895468 -1.7896350760860519902 -0.31524471913379914501 2.2435131801140073549 -1.1279229251620546126 -0.17191640075999922721;-0.54680151930205478372 0.10927198031531633327 -1.1953304515706422162 -1.77715680534032483 0.67192087557884561111 1.4098596396721474466 -0.25305610721917637385 -0.75425869271815315642 -1.3361532867675227632;1.1917196499340965143 0.37211821911791154172 0.80221636116409200667 0.12390615174960030453 1.1714118286760009102 0.4604007851382638794 1.4208728753236727904 -1.9511025676850337618 0.071914792259374235583;-0.23034694350015669229 -0.46740544920469329071 -0.42910141851171429428 -0.064186657427018872779 -1.2732760195109125156 0.44277090670379454229 -0.98483016631808306673 -0.5033068077189120082 -0.46925187575730747946;-0.2105242541047409599 -0.45668144802485860501 -1.0969416185801315056 1.8111454837928997463 -0.75381477029412446988 -0.41788530665786211005 0.94112796114127605929 0.073568539360715584641 -0.78952968680174495653;0.089801527770724698385 1.3614720170988403591 -0.82146397930474446269 1.0706487890351179537 -1.484204145556843546 -1.3144522146351793612 -0.16042975311632720614 -1.7374654332088101949 0.99869486288575737287;0.75228215397810205278 -0.051197111816995946598 0.75282846426648175608 -1.7241156559428314488 -0.16160286964017714362 -0.636894736462793154 -1.8137195633110279047 -0.47009172330093684788 -2.181586806815971169;1.1580084186693258008 -0.46396456096160759719 -0.80977077658923901637 0.67214738062726786527 0.82273350991251437136 -1.4322664452408704339 -0.95884705123222413459 -1.4220584461799596898 0.88439836746221733854;-0.26978805317395210261 -0.80034125758134144757 1.1088682187257927758 -1.0125659165201765788 0.23130872457675760723 -1.4464671526234549326 -0.10567534623101730584 -0.4002637318918731979 1.2916399343853643966;-0.55972897265139831546 -1.8047286684314782779 1.1529449145277368416 -0.46821494557533122061 0.84293576823004767729 0.69977557861257888572 -1.6958723474776224993 -1.6620339103173917827 0.044658584033729478713;-0.87236452933767372198 -1.4060131385934087067 -0.093992251456387954089 0.4180213588459800178 1.0223940573586387526 -2.5562694733614743647 0.82802569509416690252 2.0094096027602370569 1.8058478562949997759;0.88119197296909912431 -0.96804533751867183344 -0.046488728264885530173 1.0281631902336747508 -1.8470093812917784959 0.21068221411756907213 -0.92160632133489817086 -0.26069205418166152555 0.85767340013707260571;0.72861144224630980393 -0.6758386729854124475 -0.66104448383264058364 0.02640847619962870263 0.71558675259104864708 0.19252390672110084036 -1.2046685149174085616 -1.4199252035160863095 0.49797688911890575225;0.57590038778139729381 -0.40507509792747409261 -0.22819218698314958083 1.7266249070967423229 -0.097625982208695574749 -0.4206003278615675911 -0.67908673666762009447 -0.31041589862297158664 0.56548437478093760422;-0.62020951827258852251 0.051980410494659852472 1.0291945749170099411 -0.14945225983704996109 2.3454014459116541147 0.26525808241697584888 0.0518435869326927673 -2.0066328252561991263 -0.93232421720972102896;1.6214926700256091507 -1.3572354555303531853 -0.36693401989973528643 1.2925136870044200421 -1.8222538830304042534 1.0339037823634804614 -0.9603506370700848338 -0.74763660137495002722 1.7551433900191539816;0.56116040848299530985 2.0165665856892216468 0.2732662313864355208 0.72608294345646573476 0.26322751687325895986 -0.33776909411444139275 -1.7040094779670251768 0.78670697135955369728 -0.64480399499637286453;-0.7241177699286248659 2.1370542674353933954 -1.1828128434016658144 0.21244933730659770754 -0.6170638368856471434 2.0586066814912618028 0.35341820597194661957 -0.74647529445506954904 -0.86328592705221129933;-0.59763316585979231466 -1.3978499373239223758 -0.056513021923910514155 1.8125645786654844827 -0.43859242536817832914 0.60003672106120720109 -1.0623167610825812179 -0.62214157786262902494 1.8830267888317533398;-0.40880653687036128119 -0.20834103686949614898 0.56565952839138955444 2.5120670359247307957 1.6931809002329600844 -1.6270650164778996949 -0.15848158776226703437 -2.4096080276367395356 -0.63678024849347536485;1.3156493876240584751 -0.35454438766321993981 -0.065319362804161298919 -0.65992887323337667826 -1.7881785194440580344 0.08013801209965307204 1.1023111344746880924 -0.051030196924243584333 0.49523315858391875333;0.64980941361342925422 0.94250026124026942131 0.040751337022582947989 -1.6765231732960452771 1.3583432425591466242 -0.28760775316826697745 -0.41625670180002566356 -0.84490301304750281552 -0.4548730897016983743;1.3722117954298815867 -0.88819960597628899723 -0.36394127678676013726 1.7248990494712133081 -0.34804515820540504745 -1.1270502412330853925 -0.73044825831704618402 0.52975605567481942604 0.069983686528689179052;-0.34168925532749544471 -1.2011294087498602945 1.3361011453111923952 -0.29420543725910780486 0.3324324464478480845 -0.97062980634907958244 -0.47839116112555218896 0.40191277852869206066 -1.0114631586237170513;1.2979223889062294628 0.48915024775553717085 -0.8813570548456589604 -1.2662940786197856013 -1.8927641337604694804 0.88328890065643639318 -0.77106300138416183909 0.99415625287638820229 0.14147216628653669357;-1.1872863887031577246 -0.1576372310041597169 1.0744690730279209401 0.58367985908020847408 1.1856224259292948986 0.12839525031480725215 0.61606267305287731872 -1.6001253033386435565 -0.49778671387717665642;0.39598943578202799864 -0.69700474710217841245 1.4819374917691343629 0.83885435726494583797 -0.60858874013047892237 1.4011907167249022521 -0.69545059840471956658 -1.3332531484437932789 -0.13104797142010568556;1.0948613345369673233 -1.0931822480301331968 1.5525201238203412135 1.9708332208390184626 -1.9031244699864990899 0.14921360983038162162 1.1423780512262553533 2.4240829740823710559 0.56573681578319445773;0.75677559394501814349 -0.9926603842072156958 -0.73618327838760766468 -0.18698580424940713929 -1.2295375588509718234 -0.043576323553458334858 -1.0452633564656128584 -0.22600598664098861534 -0.73570988725426156307;1.3461775137485276765 -1.6116868616161033056 -1.0169131494126151249 -1.1512785964113025905 1.2236197851540735471 -1.386294288423567167 -1.9296643542879126088 -0.095175886479393595474 -0.34414259542131120373;0.54820351370669984092 0.71084659959268126084 -0.6553268138329665371 -0.24751312342470416228 -1.608213128632457023 1.1273953208986247088 0.40828878657879202896 -0.80178291600430762198 1.8553736312874573589;-1.3307669608032255404 0.7133024530940540453 0.24202078824183265171 1.7929066426387472166 1.2092894264455098519 -0.24569786257322476231 0.18711245302862788975 1.1288063567643746854 0.2723195492941931084;-0.50425225133933260224 -0.52939693779416940878 -0.40110604588364434653 -1.7477946447716830036 -1.2818886842266676851 0.2997779920087412231 -0.52102272007417660404 -0.79671576170151670038 -0.64878317006858210458;-0.68200732331886138038 -1.1181350360780697439 -0.26149925286368563837 0.66044929995112588994 1.4471883757482073563 -0.16243592953669194756 -1.229747387402102321 -0.58218623565439597822 -0.5122227251425301997;0.52079675908032485587 -0.5862823697239373244 -0.75169960915134037549 0.15155338514204044764 -1.0518736215760184916 0.89213395276924833954 1.1601613653186129138 0.9108595133999078941 -1.305335909957324958;-1.2765273750281482812 -0.4692403585102193353 1.3653506218912052628 0.42976083163727357705 0.41556601085361238868 0.1493083748954773804 -0.95753724261333283962 -0.80132510674976054066 -0.81778801263324196746;1.0149241132645587804 1.2184564754781026519 -0.46164766811759111453 -0.54362090789581063444 -1.6366567202450401641 0.011168994238382398687 -0.37900675828847080195 -1.0173143642271826881 -0.0021233578382081402455;0.21207585718271887432 -0.84090198633909263304 1.0093616109368752642 -0.04347591676106388886 -1.0191090901584920481 0.56945573544349781248 -1.3596653478662843462 1.2047798044553146291 -0.61234568093753660722;1.1248735463148595848 -0.70451310185113535933 0.61584011336717703333 -1.0766236061244436328 -0.98671236384920024687 0.29783410001089322128 -1.3424882732562470888 0.8757795584543262013 -0.67622750926162356055;-1.2075238659058593615 -0.9105030471745670928 1.0204558642503727128 -1.7647573625781847184 1.831055619595739925 0.9886850754054943291 0.14132425842658766224 0.68988291742015706021 -0.2316790710402319986;-1.0785404639636013702 0.37201060379830414027 1.1914189839145405969 -0.28933761431264060082 0.3787437647109009875 0.67331194345820644109 1.0011082681232410518 0.6999615376059460381 -0.93303765991775500233;-0.69908740859323759143 0.58565961390016041399 -1.3589719044263728343 -0.817579398466183771 0.97492103244412975371 -1.058599279671259108 -1.9533169199317292897 0.66776964470995192613 0.12034221540787166937;0.80404468754225522087 0.52328492543966353967 0.5101305946026363225 -0.39614063420513040414 -0.66999710581891636085 0.90071448097928497045 1.7333358350587073637 0.44060176115705784738 -1.0228086517089622909;-0.043114942860866194152 -0.68675614816735497392 -0.81882460788862654333 -0.98083556678952121821 0.50903475728601244032 1.9022634704250653837 0.46829505040274271854 -1.4569518542923047821 -1.7386348639948108197;-0.12239708621891776108 0.30497603606194451098 -0.86569858411898781281 -1.723841414939068617 1.2574713294720349932 -0.0018468680580735201587 0.30242248787553649425 0.68910880071952773651 -1.0973084104020793816;1.6235386083852181294 -1.159220223560473606 0.71469131619679560075 -0.7942361247825292514 -0.29348651209427922826 1.4594753829880282581 -1.1670689071077100518 0.28451738797004266779 -1.1568571097237339007;0.42459571618958713568 0.61270613246160976484 0.6324146729100597053 0.30915209929814202461 1.1938658077494554988 0.68690932216135547339 1.1079764031575398686 -0.59051345248535824783 -1.7796946301227680731;-0.41276876778780730026 -0.51801204367209696677 -0.92553591209090291247 -0.79263645546544414522 1.5606579609143484966 -0.97809230171646333041 1.0636413887490097085 -1.4652135570955722166 -1.1529467421462060717;1.5619660042393428423 0.92534673297244318668 1.4032359144938386653 0.51023659737234472455 -0.3132861995936367383 -1.6644573842464873703 0.99536459697693657755 0.2604205995218952796 -1.2164154965133511244;-1.4117317978056056482 -0.84860892962590106503 -0.55457771192207960809 1.3593113933091489631 1.5333373970652877105 -0.64372112159843331014 1.2694115466612034826 -1.3925755598541718072 -0.11962285129774739845;0.67232689993952099439 -1.0201722449887777877 0.72743589253106399894 0.91915902572403795912 -0.89352436707659133042 1.0177053093609866874 0.33105211128818534672 -0.24569631849513484667 -0.63130431914202456145;0.54982383353819852534 1.4078439584850952482 0.8279705262315542047 -0.54045641161891677662 -1.733795049079302375 1.7586022590223642226 -0.78031013856959596797 1.7666799313136416494 -0.042216454680212733841;-0.559254915654719853 1.3656033936090652414 0.88509144422887631176 -0.17702469177764343367 -0.40967746906865620815 1.2082873319671385559 -1.1115285793386360247 -1.01717922916231851 1.0284575016728030317;0.76755521262113679537 -1.8902023782997365853 0.10671210220123487911 -1.0361601678360201628 -0.25022420719650795284 -0.16905064813568659865 -1.147128085222602234 -1.4760288504391143594 0.87428749374994163546;-1.0119786481091503916 0.64330417936586137273 -1.574750158819186785 0.65340909325479501479 0.41236280306271666518 0.70159821057532001376 -1.3966737542777061254 0.52767569459690100153 0.37423588220302389518;-0.99664979227796246519 0.023269719404137141627 -0.99478862906559561985 0.53510554623717865308 -1.3137581849190924643 -0.67774703414767067944 -1.4657660734999151675 0.39750352225350560342 -1.1372690643101119878;0.15931876751164000816 -0.39388303154231329994 1.1100872990271026808 1.7053310896321460799 -0.26392052774886121114 -0.75923972350549562282 -0.0549629149134494982 2.1159729169224772427 -1.268517533585846957;0.66642746151183929193 0.0261143678286714781 -1.3940424106408644267 -1.2269619545978021069 -0.13522381602621796892 -0.31176406030887443555 -0.69692869522079681222 1.669996858770644188 -1.6246350296956095782;1.4400792588499307101 1.2061370804371318588 -0.33408794418941162307 0.95264650687354268666 0.17114971563895517437 -0.48253663485604608718 -0.54656295870765436717 1.3165651418879518175 0.95392844354078210056;-0.66224786271846503016 -0.63823881986248709453 -1.0754000113303725517 -1.4315352677618036203 -0.77040463777907786103 0.32986658864935863855 -0.086764597920525016184 -1.1152329560364389049 0.084019818713889068973;0.94358234087352599317 0.56058006519915659638 1.3414961944472902911 -0.91505962616875013982 1.3557295687749291169 -0.29204938611354425149 0.30090700999516722947 -1.3654597717072107788 0.45222485665248385311;0.10415306853942635223 -0.010325740341983712101 0.71758378545523171521 -0.50665306529649756229 1.7131558902193524396 0.10720568853626773198 0.81429775387106984041 -2.3041545965211480684 -1.1187826805858092083;-0.26314311127753658992 -0.10303824804225167333 0.40228259395987342462 -1.8407916381983793208 1.1212494920892486228 -0.96007881635642489115 -0.19523305383433198212 -0.30010771128129687391 -0.14794327266223530892;-0.095863067088016104544 1.07478074702656623 -0.71282331208443527881 -1.7440748839397923753 0.98271225042183840692 -0.82308310426543396243 1.4096515939837133136 1.2871276589682678626 0.17145290120071510209];

% Layer 2
b2 = 0.3739635309881424452;
LW2_1 = [2.4058031450119257144 -2.3093183609096752384 -2.119866175299897737 -2.9214370899770432111 -1.6346252469971942478 2.7066108858501563006 2.1509971538780678912 2.2202806515932951292 1.653061786723026394 3.1844479934353291384 -1.5828930131722795949 -1.4862755681535844143 -2.5504702197568174249 -1.0567784600147602792 1.6281159388894990148 -1.8941124553601751401 2.0613571455096999507 -1.7889210782482294348 -0.5193775762701214882 1.9627655150604481626 -2.431095152227739753 -2.6485373149180340135 -1.9505185210723421374 2.3550269802863499358 1.0938650037839185991 -1.7109606823358811667 1.0173239278543690922 0.69581423538336206747 -3.7575206884967067289 2.5912356586779274892 -2.2794266847629636175 -1.810931602953729902 -1.904095008513604359 -1.9675256686056354916 0.87468108928851207029 0.70364244870332914861 1.6740366640001236309 -1.3621726279229449119 -1.0227645759816648141 2.3153447285731463268 0.99095913998341345064 1.6492749649165252546 1.3353225128328845006 -1.8303541772397420306 2.7913650429711323042 -1.3041154631359923588 -0.99378680304452438055 -2.614442842664900013 2.7451948400545327367 -2.4554007124820200758 -1.46781229203631991 1.5241330607276009079 0.75834467726246379549 -0.82740935061192455446 2.2538404316975633179 -0.71501166404426141909 2.7255645835182784609 3.2151689743292535262 1.4283476786180853146 -1.9020807904702694557 2.1225139778882620156 2.9188902895253843184 -1.9474280898834586129 0.86132246991186744989 -2.9938420813377688567 0.6155093039077091932 -2.6442573637283932619 -1.3494858570148209331 -1.8990668637465126789 3.5261613896207646413 -2.7221488981446695377 1.7091253074083492258 -3.1623532553627962116 -1.9877187335078034813 -1.5727245328193786289 1.3056312280958441985 1.8010762728590565818 1.838396198539741011 2.4868775129751408137 -1.4416815985344075823 2.2030282799012903538 1.8787280425562096209 -3.1463922303238147649 -1.2346512939239153717 0.43020441782957791199 2.5750947847699077187 4.2866689329670260022 -1.4648488662886136602 -1.7635851450073711799 -1.3027495630820400407 -2.2406021529397368575 1.5272100915728834547 1.5337318418776957341 2.3857418344967302737 -0.63420811364691320744 0.77175282412187895531 1.4694735234837528193 -2.0555795975323234437 -3.1190816766976761087 1.9208262956030026647];

% Output 1
y1_step1.ymin = -1;
y1_step1.gain = 18.2051359975688;
y1_step1.xoffset = 0.00125200320512821;

% ===== SIMULATION ========

% Format Input Arguments
isCellX = iscell(X);
if ~isCellX
  X = {X};
end

% Dimensions
TS = size(X,2); % timesteps
if ~isempty(X)
  Q = size(X{1},2); % samples/series
else
  Q = 0;
end

% Allocate Outputs
Y = cell(1,TS);

% Time loop
for ts=1:TS

    % Input 1
    Xp1 = mapminmax_apply(X{1,ts},x1_step1);
    
    % Layer 1
    a1 = tansig_apply(repmat(b1,1,Q) + IW1_1*Xp1);
    
    % Layer 2
    a2 = repmat(b2,1,Q) + LW2_1*a1;
    
    % Output 1
    Y{1,ts} = mapminmax_reverse(a2,y1_step1);
end

% Final Delay States
Xf = cell(1,0);
Af = cell(2,0);

% Format Output Arguments
if ~isCellX
  Y = cell2mat(Y);
end
end

% ===== MODULE FUNCTIONS ========

% Map Minimum and Maximum Input Processing Function
function y = mapminmax_apply(x,settings)
  y = bsxfun(@minus,x,settings.xoffset);
  y = bsxfun(@times,y,settings.gain);
  y = bsxfun(@plus,y,settings.ymin);
end

% Sigmoid Symmetric Transfer Function
function a = tansig_apply(n,~)
  a = 2 ./ (1 + exp(-2*n)) - 1;
end

% Map Minimum and Maximum Output Reverse-Processing Function
function x = mapminmax_reverse(y,settings)
  x = bsxfun(@minus,y,settings.ymin);
  x = bsxfun(@rdivide,x,settings.gain);
  x = bsxfun(@plus,x,settings.xoffset);
end