//
//  Challenge_567.swift
//  LeetCodeSolutions
//
//  Created by Haoxin Li on 10/5/24.
//  Copyright © 2024 Haoxin Li. All rights reserved.
//

/*

 567. Permutation in String
 Medium
 Topics
 Companies
 Hint
 Given two strings s1 and s2, return true if s2 contains a
 permutation
  of s1, or false otherwise.

 In other words, return true if one of s1's permutations is the substring of s2.



 Example 1:

 Input: s1 = "ab", s2 = "eidbaooo"
 Output: true
 Explanation: s2 contains one permutation of s1 ("ba").
 Example 2:

 Input: s1 = "ab", s2 = "eidboaoo"
 Output: false


 Constraints:

 1 <= s1.length, s2.length <= 104
 s1 and s2 consist of lowercase English letters.

 */

import Foundation

enum Challenge_567: Challenge {

    static let name = "Challenge 567"

    static func runTests() {
        let solution = Solution()
        guard solution.checkInclusion("ab", "eidbaooz") else { fatalError() }
        guard !solution.checkInclusion("ab", "eidboaoz") else { fatalError() }
        guard solution.checkInclusion("adc", "dcda") else { fatalError() }
        guard !solution.checkInclusion("hello", "ooolleoooleh") else { fatalError() }
        guard !solution.checkInclusion("lrxdxvfejdkrnjillizofhtcsnsaayremyicmvfsfuxvmlskswyfjwxdnotttdfisbfnoldsfaarpaesaltnvgrdoktdnxwgyblyshlhlubpeamxfrsfhtlcezzwsjtvcmzkpvfvmhphwksghfnzhbwogziokkkhgvrmndwsjjsegkdfobnecberwraetxwdxemzpoakgnovqpjgslmakuceqdorytxawxndpbkvsbalgfkreaplyrkbxwzfdlzsmoazxcmrmattzszqehtevafgiurhjbtfmztjgozkunklacupomjjafbzjerxlvgmnsjqcrsrbrcugaofbiuvibjmekhyddhwberuoaxfghtdgjwbjlziraohnmkhutuyftiptmdeshtyhrhtdkhgkzoxnulfqboeimlepwyihauwjsermzmefzlkubovxhrtkbfhopvhwuukkacivimrnjaxmpecncgxfelmcfgnqueelqssgpxpidtswwrrlusgwznwvuvdahajoxflexnctsgmjchtgfwlqsfyoamaaaowxttgshiszohczagbgpoqibghhawdjftrrgpuailqfpwzvytgwdyqfymihyuwhxzhawpoxafxvnwvkhwubjypxjnqjkfblpeoxewtjfnlgiwfkxuirhpbeyokyrbnmichszrsntbaxrdiznwfiokbuhkwvmhtunabqninaztpcvzptfjnhtxzjuupwvtsaateiuerftqjxqkljxkdindkrnsmuhouhpquabwanjeoyaheqgdkdyqsqdzlrdwyrakfdphasupvuhwvtsesrlubcapcdzutmiyyudpognnmmncgphgmfdozclwgvxhhsbxaexuenknayihkarjrbipmnujdfqfvvfbaickybuacyuutbarjsmveivscoktcpfzwlcjemengveudvdlcdjnpbjbimokldsbjlsdasbgjukkoeucwlhtmkxhbrnczapqhoyhrqaogbkeqsczwlloqiguclumiggrijlymcszkqnmgtzjcblnylpigzbwiynnwojnkyxnmgoodljmmqcprzznsmcruifltbdujttnpjnttlbfwlclgewsdcjgbtuzwsayatuqvmebtvihljkaewfnqbotnmkabcqsxbohqleqlrujvughzcurfuhmhfklbwbaudmyfttsikiwzbvlfwmetgsnxxlmjofrtfdfcsnqbyeecgzelovranroxccdaqyfqtkjxeqehjoeqytkaombdgfajafmvmqzzxfaiezovbzcyihaucpeopptarcwihwklrpvtkqnbbquqnlmdwygbtkstzwdznbevlyfivqflpacmtcsarbbkmenyijnjvwlixhmqrqrejwznxzdiqzrrfejxfmcdzmfkjvbwfmstilkrmvviywuquenujtcqbhkyxbnbbdoxgyjpxfucdmsecnzstjlsivelupyptdogsjepgjtwgoexaxjfduvkldfudwlxmnjyynypvdvgecyhflaiyrhbqmixmwgsehsfmxyjzvkioaexjbcnakbakbrvtwgghwhfsffnamcgphuqqxqvbdmfhrzxlgiunazqhfsxgxxwktpjicnmeaxyhyfauegcdiykhuouqqnybgxcazckmzriyzuulqeqtgjuawvissukncpataietvuwirkaifroelxsptnolduugufycgnvamsardwrueajvhqkkxkkhzphbuqbldukjdqcznwscvnnqnwxszplqyfuctorjcbucxgfctibwfxftrdliugohjgmbxqduvwgrdmmawyhfgkkbeojyxkoftuluolffjvygyzftmcuthegrxdkyegkucgnukwvyjqjeewteaivfoybrwaceyasgwxsznkjzwyfjoiqeclwlrnyqdxmzadkjvhjaeghfcaiyrjefpkyhslkeogzgijtdymtwcopbvhzcqficucdfzhndzddunzhnkmllhjrrjcvksisdphhmqcnsrlmyygxhlakemvncrogiljrtfyvdrujjwowwjxbjxpjhebvheexkniipvotlumxpjplncxsrezcxmyansqmarfwwtwngvcgqcijzrhvlwalkcdsrccschgudpahdvlunyzbrdfevmnoewvavrklwvfiilgtmtexwzfmgacugaalcxqeplsmpkplutliqairwtbytsxzlupqplbpadgsiuazxvrdwjzxpijvwytgmsocughjqwbsvozcfbflqgokqjdxrivnioxcgefxmkjajkwllqdcepegzzylflfqxclhsooylinxpalctbxsvbdjqmmcyqfgfytstbpmjgmqhmnnesgovyzwsatnvqallzdjrtetzdxhckykznmnuexzsfyncndzbqstxwppzjolipszefzxqoyjteoykmrympogufseghdqlvvipuwfzheescacwrbxkaqcutfrngmzmqxeeorppkjgdroxoqdkyaawrpcjtfxzlfgkrguphggygibcialnnkvlnevkbapazmpcguhmjcmizjsinmqjknavhumrdmjnbscndtfapztvczvhkpcowavszavfcwwlzdddpuliglnjucqziltqwlsibodwdcbmorwyyqcvwoesjibeqcgsbtcelowxtzryhvepjcqnpmigbdbuplezwgcqekhxzvsbwlaunotrhhmdrrfjoeyzwzygeypgpxonkzriqjsecoqdmeslcfgnzlwstigfxogzwrjznvgtrzjdvdiaofktlzpvnjftauzfmgigxuydyddabcucklupsjycdbdzdghkiryjrjuretnulfczhhwdoayrrvljbihhbmxvzyjxrwkpmxxephocpleznusehkxjgjqlalbgenuahcqzcbvnurwvtwvrvefnkdwywtokrxhstwwybamnixtlokktydnuqrnxylazddpvdbfhtevujagbvqkbjtcvedzrqpkwmxnsugrklcimmgbjmnatgmyyuvnbuffgjcvclkglhdwufxclndhyvoecrfqfxtmunjqavkrhyhlltnxwjsdzvkmxayxmgvsoaewlergrdaxssqtavrkazjkamfeyvttdytukwsqxrevtfquuanjywitzajgdlsgonmxjwxqiekadyohkzlowywqrmnydclodaichygaxhljvvlnbdpsweicfyntnxmaxotdnizxdfkhtnegosqynavfeludbsxylfpsxrnasizvozwlljokgirgewaskykpclgictznfysqmwpkyjntcvikxapgxupqewswsuqcnlajdndiujuwcfjkhysjltdbjjgxgnbovwzrcibzwasjoitdrpyureacgvdupxpzqepymwjxruyxkjhlsgiddghluhkomqmpzbucxryifzszpmknuakmbmieksazgsmzpuybfdlpqlilcqfewgqkywbianhzgizbgkruslhepkllojtoewgrhxmqlziexxfacuzjgvpgbusktkkctzyznwycsklkrrjrvbmxbhrhpwaketgqdubkavullzlhxdahukoajvrjfdmcltylxjllnwycvbcddpxidjzhkpwvlbrnxmnvseioujesuieatdxcptqprwaukeqdodaedzbwmybatapayautrbyayjxtnvcniqleohffgxgsogwslduzbpkaxtxwzstjftgriebrlthrhplhpqtglcjzoospsolqtofgjttxzpdceficxvxvzkfbptevvmjiviglepvhatglwgbeywcsgrqrttwjblyskptgwkhlyudcxolbkajzjeuvdbdourryxldpzlbfombingjbamxelfvqnusymtussovzxkyemigegqlqoprynkwuwhxmvkacwplrgsdxbcoykxbgfyfuclxcaxpzqgukwkbvrcmzvuzinucgryrnjvgysihixhcknpfgjmagmlpihnnbniksegyxybmgwsqgitctffwgudyvrkhnnuqczybxadjfzbakmrpzqgsfdtupbrhkyqumimuwwtwaugrpwppfcgpxkumziermyqqrihufxtfklmjsipuyimbrfatepkufdonqditpcnxbanfxfhmmwutomluagakhinnrnjwamaztgozkpwyxipxlellbszvgewelbwvkxxvrmtvuiivdgdfpwwuwvmxnewqkpoocwbzmpbscymmrbrtaazhpxvktdoukayngafglbvnmvstahrlsxwumubkeceevztlzwiyfiwtyuiyjbghofotfqpygwvgzlzieajohxtnfwfjtpezunhtezmgoijeullayhjlrklddeiujhukyhgvwhztrvrdcbxhuvgiwmjwetjmwzoipopdegynbwjbxblgkgcbeljnlmdogjlmfcebkpsdnojqxzgmmwprbvjnvghxqbozfmbfpohiwtmdzumxlgtspaodgmqrykogolwgvklwvcxuwqztapgggossaayeiyramtvoicssnfouddszofopvrmkhyihbiuabdzrxflubidzkorufphwqryyznzlcgffamyeacfjvdkoilbvurswxuwbfsgjqhsajbsbvzxwlsazxgfmnlilenuuowslmlrrbzpkmoelvhpvqdwuutwdsowwldmuwzvouqbynybgnvojeyzvpsyzyrmreeahzutgbgoinadnfnctsezjixjdqkrleovfjydtnndeuycghsuwioyqjpdwhqtgrazzbxfwgykjbvewxrrcdykuomrlhamlhxzstykmfncbbkozncogbthvdrttafboicppqgfuvutfsrdvpnvavatvpfcpoczukoyskqyinzhpdunoxffvjpfxyxnelalhnwmzjzcjbndqkutxlekciqzxsgdynwvfuhkqlssuywktmsgbrazfedmjwfjuoxroanbipuiilqpwzdcbalwdxxrpdkwdrjzxlczzbwxlecntxgstkhctsdjocleuhmstcqnvlgkedyibdcdohnzxavsdbjvxucnuirrjenhxxtsyunbydyllkijehpwffykdjygganbiypiogebqmsndzdkqyodabqrwitrmhwkaptgrtfyxfjtdvyhbjybfftugtdocvomcsfowxbdhncpogbyioijutjgxirsauzvlvjktllxucqyniowzappgxvngghdpdlyrzvfzonmmijwxxbgvaikrswfefrruptiabegaomcjjnkfoazlyvdvppywcxjpjbxauyejrfixnkxflguuqwbuxocawwuhvhlvrjcklekcwocblavcitgpwmuxawxrvgiibgozmuyzvyonyvgyxlezcajxchiytjoaheozixofdgstnijliogyvfrlmaepvifdrqfrdufbuhqjqiehnakvcqoxaskpbrrgynnkqvnzhkbglpaeqdvqxxghuixoydcwupbvpkelrzfwlzenzoqbulgvvkowpddxcpfrigxgeuccqvkzkfplcyyaqsheqjwosqsevbuvpglnlhtoieubioskacdfpvorogamnbwnajomrdfrzgkufouftmdiowtxkmbktzvvnegotgnzmklvnhmwrmajxytpexwymfxcerimsyzxhraehnhmshkwmcvaufbsycfcdjacgawmvwvmvybwqajhflxmbjenkeyvyullqyxotwkrtdgglgrlxcjiicnsutkjldirboqlmvfrlllxtiquhfpxhczzrmumznjpwcfmwmemltqvkhskbchpwhqruvqnqixbtorkrhxomtuybgudzonchsslxyslgzecpdavfxescyoitwqxnvcsepeonbuzoyoeypezouczbzzbnmzccgkhmwfbmeicmwqjdegmbbckgioqwzapatrbeedksjspndjlvljlqqnesduhbbtmgrzpbjhorzhknjpkrxznthoxsxxrnppmalnehvkkpdoskffkqithkqjgmtbxgalntgispxkgqvhxcydzfsdkuwdzytkolzmywtsqqbkssplynomcsnfethndaicofgxsaslupmgtblvwvhsamejhvdqhuijdwglfjpfagvtjmmghikfnetdewtwqgsjwtlvwjcifwurvaqwbcrpiqghnntivzzqdvuqtucbwustfdgpqvvneouriwiqxsyrultkiysyqcgijkiqjrxnfwrxahlkrcnodyjtfybfspqckojtriwfojgpcetjayrgjtrzigvtzosmohlywfyrbtryxhlcbhadacpplueillitgruqhexwcvhxpphbtksuirsnjnxvxyyiibloqmrevjlkghynenizwpkzduifnlfksipmljdujwqafywlvagomisejmbrzbxnogrdkikdvdgfwvxdoxxahtskkyonwlaulsrdjzokijupfxwdsqbveyieuwrohupopshocaeqdnsphawwnvrzkyzazdccnyodxpnuvjshmkrtmcklnqyeoovlexwksutsvhkbrhjhhodjidvkejkkxtvqtcpiiooltimziokpzajzfvpylcoxyglbkrglvnzftsmzmxbovviavuxezpxezuxzzfrefvbukfuwzhxzjkfaynfcjvkvbndrdjqdhnsrcxicxsxfjsdpvsmwvpqijeemnknsofeqywovbdpdopggrfubumvranfzpmehzuqgykddajkwqllyhalnyoylkyoczxozzrebnwljnbxvdxnaprgqwmfjeoyozqwqlwudlxjpuukrqupzigbvmoysjzpprcsusrzomywxqfpqomtztgrfggyhbbceiniofjaghnlucvtfdupgbhbvnfvtgexgnvjvwdtyxxgxxvgymtfigraqskxvnehqohwzqzkhxpifqrutlytfverrlbdwfqkiejvatuzccuxtousmxzppnkngxanzjhugytabydqynmnocqlcdxndwohtptktjdrxgtkvqyzoimgmsomqtnebsdvvrdhcalhgsuoglebfdhafgezwjnmgoshzoqffbtpilpberqitxkzyglpdkcwwvpdqjzwcvqiazhrurnesjrzmvwvdboouqyfhyeziceekrhncfjhdeumvxywinudsfovinwxsbconemtexvfafxhaerjvqnkchnsmgljwdddjsgcadvavlbnikfwvdsckvluigdvcfuezfxxxkrylxsnhwuduhfkdakllkawxmyqbkbzcqjmsbgzfpojtlpqvgtqlmwurarmavmmiatpfxvfzfqacptkhjgobtcsnazpbroehpizwtpmrclahjkkzcmmjznsyaglerbnkzetxrojtsqffhzliqwzdwefypaotvgeiawuwxxfkwlbzrntcaloqbubnyjdnsspmmlckzdpllmcncvrkdqrtmfbbbjsmuamsiipsqzexrckpcpnfnhjukamxctwsbfrcuuccbankpotvedkkyrmbttbzasydxkszzdadjlzrdmzbqtsqazuxeloeutjxdsciiugbwvfvwykptjbmrlxkqxaytyzubavioljyymsmkdzbiboaosucwfvwovzwcblglzdwuiffzclexudskropugxsszdttwruooehksqtgwabwrqxmiqcidjpadjbyldjmgfghezqzkqolfueavyousvfmyuwaaluszwzkgalilmguoiecvhsawptpskudkmvbniybaslympseyyinueidogmoiedkqvuoywnduxctjjvjhcphtaddsasmzrxwvfxkaypozvnhfalmcwvqcaeszthvbqzmdohdeqkfdeeislkblohlxrxqydoogzevgsbzhgrvyxvpgyngsgqzodgrrtqsbnpvfhybjgtuufmmmsekzmuyuejpjtuisqkrptauhsjcllecpfyttiapogqylltbjhzrjldccfybxsionmqpqeyusrtastfoqksshmziezadeogrojwcanijxknuvruioetfexnzfejkkxlxrktswgqdgkeznvyzwkjlixlxxprkbtskpjezoycykjtxjorxiydrgvftxttaciifiifbdmbhozmuftpvekolyxcwnzhwgmzcsiumegewfvyxwaijlgwnjpxohsfkuxxfytbvrkcjzlnxmmcgjmpjzbovcppppmpuvfcknlkyhbcaevgviusffgceekjwhswxhupfrtxhwhjmdtiicppzkcplcqaifzjzfnbbtistgucduxqprfughepxnkzengymokugzokudxesaoflosfcxdulhdqlhebhmuogzkqqmvpsrnljwszawaazgofirmswuogqzdbezgfhydcgtcmbipuuvrzzrlvsuxqgesprlrmdtvzukkyksflpojpmfkurnmjslxvkrqbknmmeavkiqowseqiionjffctbfgvdlgridoowjwflmdjdjpziiioguaspnacxlwlyosixpbxukglrnkzjtcalatqfxqrdrbfqltsgonoyzxaittzathzvrtjpmbnbnbuqmxfcwtxvnafhiksmbjxpxfshqkytwunhflybohwzuvvpwaqlwdbxnnzdnpikwnaxjyldyltfoiyqvhzrysfblphtjyaizftfmgbbicjfvbbnzjjofpymyrfmihrssgxontbmugivvupgczbajxodcdfutzydnfzwogncjrnopjsxkxzpxehitpeduciiiwiowxlbcdjfekjpzhdlmtkckhldpwcqntqnoftmjphqcfpydbmkpgwjpnjcgwwshltewdooxmzmmhwpjckxbrcwismkmkgnduvnbnjntvaaasxocisoreldzcpmnftluzqrvxpftrrvabdojqqklqvssptacdcnlejxgjyvreamirjwvlbdvyuuolbcdgoihylhkpqcuokyyfzzgldesantmyoqgcbyrkdzhhteybvgbeeektccdgkvmmywzdtaspyuilnmziledlzxuhpmcckyxiibjdaxgqmxybpewnynlwykabudmtmjwoujqstusxfkpnbhgjqoxxhxcahezybokuanmqfbotwkagqqohaxytqmeruwakokwomfnrdefuljckiixahakaxsdyojvutmdmgxdiegvlblyhogqlewcddesebpzleihfcrttmkewoalaxathwluyvvfbavhjsqkttzodstcekbpnthsvprfijukbuvtlqedjamwfahjhvivcoarduvrhczuxjbfxzitlorrntwebjauxejwpswfksxbtecdmwvtvjgvelliisqtmbfazilmmizkbqiifokdaajotapnpkqhdgsmxhtndlupujojefwkasgsqgbqnhkrxbfunnzkfdtnlisryccnoobvewvavmhwejomytxxoclwutmthshxdddpokdprsfumpcmqhbtwlmdepchvsfkoyfzlsxnrmmuxlktunydlndafnvwhkymapyfwwgkljzufstoofyguubmmhgqplgyudbpopzvsijjerphhgyqqubnkgqlqhaiyaulzufdrarxaruxhbzeowebppjirmrnffrwcmpxgpeonfndbeivayxqttgjqqpizyuiupftoyvaxxxqqxdnffhmfmtcfkocawihcyopiaxvjibugwitexixqxsuxyubcdysmgzelhgykjfizyuvqmiajlokobiwmnuggqaspymnwfvorlpzjikffuctkjlpsrbbnzpjqgxxbjfuuqkkvscynswjnmfrcfwwjeqntczherfhjrvgbpiqfkhsgjirldsypktnjphrdiuaiiuimptnqofmiqqlqvnhwiitgexcjopbshfubrlsdbvcdfdtoufxiphxrilhemygjytnzvabaqjwbckzbcpltovszpffbzvhlbatguhjufkjd", "ylcotuazxfmsojotjtnjnbmiestmchaxbgxkimkcgtcutoqfunbgnastygeqvljyjnzwssxenqcqmlsfsxyznxqauakdjcczivtdvzhyfyzzzolhqfkaaazkjznxzdwicdrhlbxnwahwichaymehyqtwimnxpszgpdpakeuyqudenyntlpogkitjklxqsalvcdsptrhgdpmuknnnszmbbcroqbasxngigfnuvaehxbfqpmvkmmdlofgemxhordbctbafsvwutdnzmemmvviwubpgjsugexoevbbshdhguvhhvdkstmwbhtygfpzsjuqnxzamcunrqpmceteowiuqrstiqwisnfrwjhlbplwhlazvkobcbzgtaszyejkpcwnpstvsydjfrastxtxgsaeotdgrljmjtcykqvmcwoqjyrsuduekjpmijyotoypocpadvlzlxrpqojoboyflqecaqqkbkuugezkvvcvkuapxiiommosbwnrzxkesrsmzolwbtkrejjmidkbjlleqjlbwszdujsvryswyjmyetbmevrnnmosbbrdjnrfpjunbujpyvykqvwylstblxsqgxfaiiaxlkpkqypseezubvniivhpuzifpdylyrsvskexspzrjppzhkzkhnthtiwtwpknlyyqkclkplsdxtlxcmaplljxyidzwtykvtopfqbckueypiirrugnpvzraezxxmbexalqptvqdyqehyfnvdxmfazxkqzhgqkjdwqqmykvyhfaojgltqwrsesothqrrpdgmepgxtwkgwkxzzdkagvvqqhcsgxeqkajpakymxhybbxvfybgydshwneensnehanrrpkqkmxnyizlficycvywfdvynbxbxkleuhzqjslbolebykvqiarifxbofieboyollxqukpslzlorwcdadmbalgiiyarhkbevhsydredoafxtbkbgghrqrzlwyxpyxsesqobqgvdrjnrtefywdscecurexmqcvjhbeareyrzskicpzxslhdsdilsvdzejjnzuasswomocgmpvxoyolkbvsyvrkpfgdoljgaxzmjrzbsdqqferxhntuklenqcofnrcisedichncejxujhkqbluvckvogiprrmmqmjivomhhduyhastanololwdholknufuipjgadcbkyfhhwmlspckizotmqxstturxhvbopxzatdbcbftsfkvrnliswnlcnfjgztqiilhtrfshrczhwrdgakwyefdcregeybckvuxgefzqitllufrcrdohjrnvsliidhotpfegytotpjgrgvxzuxxmfqsslvleslloegsqiniesztdgqoniyperoecuubmkniqxdrpkautdiepqsfgyeyhcpywybmqpicoxjktqlhdowlzqnkywhbcszahuhdzusjrlytjajkhbekgkhfjhyehaboyodfyemvbdpumpwpepllwnkglmeoeutllgmnefdfsjjrhwncdjuoglolgnigesopzcitzmublikzvbtuwfmlixiouohygtpecaqiarvlvjquhwgskivqnugscbhwbfwczbomoyopkmcfawkptowxhcoinryagwzwqzrcvwqypuvudtqqootykyxjszfnwamnnawsrzxujldwqecjvgqasndukzkhjlglzafuuzkpdopxvzbfztszdbixxdhwuvtmbpgagodfvbkndlfuqsszddpucpcnkkafgztnthrhtviyusxpmvrmxehzihiloycjtxitiysabkskfgadgtanjgwtrtjblxdrpffwxbxxverdeaocyvtbiuoswdfslupbvvljskyyafmafpordsrcxgwhsrzzavxrxyalsltbgpazjsnzszbodpckrbgcswoisqpxrdqpyrfrkmzgnxkmwrsrjpbxdsygiavwrjtsvdrqcqdvcksifjmkxgjjbdhhonsmeeugggzwaehrkksqyuxfiujqzymvshundzkwufqduffudyiwgsmsgpcjcjcjoifgrtzcwzbwugksbjwnagrdkoyupijuususnidrwhutyumztdjhkplfoidxcpecjonvsyyegvgqkkgiftkpoiilavundmhfvylqyvmrsumbilvwuavxaprngmzfjmxfvbvifdujwkufbgdxvtonpbixlgwhaqywmvywqffjxemjyvimpdspcypuybsyplwpmhmoxjqxbbthncmpgtupboupshzwcftfezekfeqbtnznmicivderihfnhzgwnlngzaxmfmguhjzbrjnuvhfcbwbmikizkcrsuosadtdxtvybloevrgbvbqapepuoagfnbghvyczrfuoxfryilptnqvvekkiafdpqxbeebaavhaxodgignoovzdslkjvhhbfrcbyqkxdfpycxxbemedznmybhnmrlbtyaslixovkagqzcrzmuuqmnrmsbczuwazwzbpqjuoztiotejzfhmjdorvdbltqfkgannctbfwspwpplzlrwpxtfknwohsjwkypnccvkudgtkgzqcgrgpuvuhbdbhpcryogpuzozmcnsvrnjnjqimdozemipvdmurucidhtfwqfvvfvdjitdnzguxfmhzpakfacbodntjkkdjlgarjpdvwcmeorpgknauhqmdkbwosxgdgffgnhmmgnmggiemabhzlthcaffclixppqpahguysacoqroiekpgiflcaqkkzothgyfseissmhgknopogzfinuchyfwjsjuiiksttqpwjlyimcjnmalpqvbtsldznqwugkskikroefgqjnvzoplgfkzuqqyaalnefuircgrhwbshxunccnrdldxybkrpwwziakhemeusnxofbqqrkguncposjyljhbpyrzuesxxanbjxmuuabbrwezrehgfwqrqyflmmlydprpfuhecyqvmnhdrgffpkfgaixkrpcrilctvthuvezrudsmlnexfnkzubgbzatfcjjguufflaixwjgvgpcqyuxwsfnowafnglteueffzratxnqgibwtvcygoppgcnblumxfavizherpzfatmrrliswqegsdykjpbzehnexbpmgebrmqasodsgxodeqfwqwnytwtbkfydtizloygnlilyujxvdqeoquovhdpsnbltlopwhjwqzzwstofvocpnmckjlwrzaxrmvbfptucbnfvpqxybsqvekqugkcjcdcdmueoovkeyisnsqlcowimxzuvwpemluweeiuesxzlbrwehzqprznyvpwsezxgvafastynbrmuqchfglcowjvhevwuubhfiormhtlrhpeytnidyzppobjeclubjigdrmjyymyxyelbprgohpberhuhcuyvpchxqqdpgdnfgtmauvwidlvmlacdqycievmjdmbplpcczwiitflemhfesyhulkgnlftsyddxpfjispiebmzafbqxxxsbejocgiigvrwmqfcganokzaurismihwnikkmsdcbmfyfcuutrogtjlttaxnolsieihxvubpcfmnfnaiswjaoumfhmivzpbrraeftyhgirmrvyczfkssdnqpuhmjafvpnttxoixiwejurkijzywvanfxvkkmgqtqytnsfntetauncecthzjxfqrafouhagkrdsuxcxnzqaiytfdiqtwxkmhuhslnditxhjmmuijagmrrkpztwwftsvedtdtqetluqmcepvisnwvsonkxqelxiatbhhncoyadghlkegavegncnzcstexayayoupgwfvxtcjncpktjivgruxslebxukudntwhaftyevccdhwodugpdrqfwpzpztvthlmhfscdumxqosrgfswgmszyqsetwvmfhxlhuwulpvcsosqrlvzklksgimahvdaoxqakuvtpzvfejrflixyoyvdyywcfakndzhrvbdkrillejoicbpmhcnvpyhcufaezunpkoripsbcyurthkvnmkkmjsvvbpbyzwcjrcoemldczdslsezavblhzoxbbyjfuhxpbckhbkpkcdmtcvudsoqzbnegohzyhxwjsjiuzdtbjbegkbrkpohrgezmtxdiaghrfrdavhidckgmmkspminalblvgbauwyznpbtfpqzjzzlvzikefcuahffddmbjqpeflwgvsqoxmbxpxadaglblgroxqwgejpxzptlzwyfuhyziahpsyjljqyzewzhlfoctchirzfoxgauqaqmgzjeaktteinwhjtkxsnogefibirkctyuxlygmrarvsjvkytfdqcqlydebagavluuwgehlvuhcbbmmkrdlbnyqwlpnkfgmjktwuwtwtgaiynackkkvsbnkjrjznvmfeehzaorkyimgemzkwjzsejtzlbrtxspqhwjfsdbikpitqdissqjjginuptmrdhhgllrmxokekfldwpgzbwyfuctfohxrhehjevtbeiprlorgbuzxoogyqdvfgiblauogzefsxjiieezxqrqqltfvpasjefjobdqwdsizqntjeianpwbyxlxuqpasjvfrccwaumnvulwzfxqqkvjazxnicvkyimzfyhatigyhinvdqswpddpesgxrhdrpajlndymewtjpbmbxzfiqhviypfdyhlkbqjszxnkiehwhiezixdomsubvslkghkkxqgxzqnrizzwssgdbkgwzivfqtpwvzapilhmxpxigjojiosnkrrywoyjppcqgmuzfadytjjdbtrxeviprznshajjoqkjwdxeouuvehkszilakgorfcgkbvkpiwdqjzanxodhancltmjbjkaixxrcwvpccmzczysfokecjsaurtwtxgdogvjwkizbyoahrbvlsomdoxskcmvnorzzsjgekmdshujurhzowusqnlzzwvzfjzpmpnphoaockosikekbhqgfsqxqwtsuwmrieviwbygbgchtawboxwkhzyyosppdptngszaouukrkqgddofeiqsvcbzbnrwebcgtriehdhvifzxfjviwooynjzugjhdjstqszleaklelphlmippragvevsbkklvhluozuehemcarroaftzihnnuadpobwmvhxiouuwsfcphevzcuizvpctdjkpwhcttehvaivdxsvesgpyovtgvqngkppilqanxyeajpjgndkrromomkqfuwvnunzdqprzbgireucpvfimiyfrsrfeaibngfxhjikrktqcjcfbobbdpqrinprlmshfzyescgoqkpyhhujgfaasggpgujaprhjbouizljenfhacaobtvbwmdvilczkugwgeytzayoxobhcwgyzwsbonvwfjfltsycnxltltmntekdkhahuvwqucmtzsnagdmgflqgpybsbsfiuxajtrjrugpxdymrmjdllqqsgcaqvuuokajeubdryouyopwnmlqqtlfwyngxybrvzhzxvqyigoqcziemctkggxynbtgnlegyygyxndkbondpofznylislptfvxngrbctfpvyxlooujbccupycdfmvmailpyosezhkrctdxdycejuvvyscfhjnhdjqetmpmdnyhhprqaezkcbjjaqbekiutcfenaahsxmheisbvvtejkpxgoocpcfozswqsswvdzprzvyyitspufrwchskadjmrisuxuhxnnhitvfkwqnzpjbhzzcrbaxqapgcbihkifiqxjvopnyelulrauegwbuqqaoscuoawirzpfeidhtwqcnujbyrynokbfajnzjtctocfepkpzisckezbtkuqbivbecenwilmccerucgcnboxpmgsoojgqtxevhvmzecvktucxbjmirmqvoiebyhkzqtouiaoojigebampbncmiaqojbkgzakijdahjmtufwcxrmjcqjfzbrwwtnctgzhztefngvpwtdnqrrevzctxhkzckugtgekrkbmglenpsknjcvitacouzqpiiumixtpfqlbvzsylurbgytsszhomhnsrcccpczcqpprcopgudufouncsynqjwwtdqnppblgwhqhldkjmdsfiqhgvpniyeznnaxduqpwfdbhhbcoisuphnbynoocelojbqvuxdcjvwxasnxejjczuvrmrpcklvcijphbghcnbevagdnqfykifozsohueivxydchtmmawdaoiywhdmhpkkhtgyvgtdbgvcedwpocfbuibbcjqpkjlzdjsbanjihuwwvmchovjgwunonvwkqjdqrjkppfekjcehismyrbwrsikxuthwtyyzsikpdloayjkwbubwuuzyueyhpnbljukmqsugtzfpfyofptdoaxwtfebwqyezclnijfhykymgmyjadsxaxpzhaiqgqkygamatbpaaaevtetyoosbwvhferwvxcwzayfpfkgyvjgakyqgouhimcyccputtsrwejwliaxewjaedfyxhhovvdwiofccjjfkcodahiafzhhcundpsdfmbxlfrldyceezushrrmbkboaneauydlhrhhqfslwsssflzsnpmtqgsexgxvupvlvuucgnvchsayimzqwhegmqvppzfnasralodsteegzgdkabhkoaaiizjhxghxdshwqxpgbpppnazfchlueyqewpazmnitxjhxlmjfwqubyfpzrxkcjdxsnvdntqkohgsbrozewitmlyxiscjmgyprgtgkqzwryyfdptapcnuhusbncjyusndwbsxuwxlewjcmskculeinswcagtyomdoaxoqnirgsgvrqcsofzzsesgdjmwrnyybjesxrebxkjappjtrlloiruslbypzparqurtqzhnbeiraojtebexzzeofeqwiwnxdrvawbsnhwawncywlyrvmuwtdiyvevuvvndslhgrussnpzyqlmsjhzeyufdrbqkqfpdnnlhbpsgyswrzdfuzqhvftadiqeslgbwcslpuwqkdmkwqdaxuvuthcggpgnoeardqnhrotewuypozgmuzfxhqinipomfkydmcnhifpmrktzqlncoucbpelwtsrcjjwphnglgcgsgqelyqbeymotiifnybgatrrpbowpcsegimvqkmabnlbensjotxxetwhosblyxfitocmaokoadwjlvkgzoreyjkrpdohzmxljdrdzjqjojvbiyhokaxyxfikqsthjoamkxhkxymsgvklzvnnngjasswsbyfdabvfyjhpijkfwfiowtdhjciirqrbrwdukstrlirczvdzkkshfdkioucqtfmihpblqxwmvpxetweoifqiypthdfykdrkbwwcuyuygpqiqjadwypxtdphavaedauplrxwjxaitcoetjbwvhpsizvensphpexdvqjcxldpgizcysqljarawvrpnozhvslfuttphheiswsaxshbqacocmdkaoqnszfcdgpdqxezvwkphtsubkohnpgrdbjutfejpobxckjtemroeidwyzduxvbzdpqxkppvgusikpgozxttvnpojlreuqnpmjfhbmninaqzlgbvhbufgiuadefemupyrccczupdhsmwspkhhhaqmyalgreqrimamsqfbsvewaiebzffbcmyexchfycyzubexlgdhdafbujkbosnicuahvuajszoqmwqpbucusvdrteemrwvshfeuecdaswheuyynczjkinsnwxxxibgqcgcaxmmvdqpttyobhwgsxbuokjppdxyvqqtenjfbdfcrbdzllvhrlnzosfhsmyknjddmfblggrbuhgkpxxgupdbzkigbvemtpmnrmowkrdzegfpxplcwgybdknmbwyoyzmhvztoogkmrluykcrwioyhmqctnfnhngbmnbvgnfwtbvtudefcxvuylmchgnvyorxdywahexmgfjifvitjsbrbngoetpnqgzaiplpgndlitifeclroysuykbotgbszfnkhoiulxahjjwtxxfmozfunexiehijvvxtzwtdslklzaytplnovuvycxirfpdkbuuwsmsmqoqjfoodvbaavdraxocjfgdmldvhdylgdbzopxfgqsfbwatyuzusjpbfeqtdwhqmmzgtvokrtvkhkvzzxyjyoalgzngofigysifhsqwbcpdhvwvgsuefqjcakzujhnrkftzbiqevokharafvehvhqocetzwyjxbuwppflibuzgtifnyczhjedujdiyrqnbscqapnwulyoosuddqeflcrtbukvacifqivlonjcvsovzzhmnmoufatkqofjmhjrcnbkcnzaayzokqgvwzkjybnfioqgtkslxzfmyqldbofuyfqsevyolaumcjsmfxpdrulslchkkbaxrwjczxswhaxxumjkicxnvhwtxonipuogiderovcrhcyrczcubwgtyeeyvueazxseuhupjzxesveckigahupcdxlztbphdhdwvjtexivbkxyrmdsypabpqxixbnseiibnauhnbxqlkcwrvrmtdpbealttvvelqifmkfsjzhnaxdrgrfljlfrnqtcozuilmgudlzblnorriimmmgydrpostalitfjdxtdzanqwxfmdvduvpjtmbsttaegjltahgwlvhumxzjcrmbfbqxehmbvoksjlfrvnmchdcujqiazavyotzcksxrtlwzrbxdvdqfordtidhbtdjrpxplxhwoeutsevzvfthpscglynwujnjqgonhlojbjhcqtagesfxoqjcmvvyapmwnmegrttcauutfkjgqbgkomzhdnfxqbhlrmnznnqljffihmfxoziojgltztgyohzaxrqzvxnlcwegiodkiipzfgrnpdzxngspecqbdsdibrodbdbzezbgzfnbszvamskuojtlszltgbleebgfcriskbvxdlinojdqnystcszubjggalzaapkhvwslcgypmsrjydmnflbntzbykkbfaixyhuxmehrvxtdvgjimekmbsnnmkppoqmitlmuvadzyibbakinnaelbgpjnyvqjovucxpmsqtxiaxdyzftuhoetpvvndjqqdtauurgatbdshriepepbpquwpbppfqccgnbbmiaosrwvexrgrpvbnhanujhzyvvpneqexwmtdlurpdmhgivbtourwplhcwxikyoqkgmfyrtagybcgipwrmcooirzpaminzgfdnftdkgcdoemiatlwmclzbfthmkdjtainbbhbbtpjzybxpabusdnsbomrrwicghclcyhwmgknisoppgzwnfdiqtxctvitpujafnagwtippdmbfjcempupwdghhcqngyeszyicncylpfwrleyhjrxkoodcjclwqpcwosoirkchvieljwindydeiebtcouwxtiqsitutxjyzccyusxyrqopdbgvxgxvjwykgliphvhfoqxacgslyvzxczrrgvxptyndcinoecxkmdfuvzwukskhwgcchczewwbzsrcalgjxxkdaawwemrdcnsqpqoqfreelretvrtsuaunbsejbynikzslsvorwabfnkdnurzpcyxkkoqfonvrbwnoxziwuzgyqlrduaeqeqrxppbajzbdchrzwogyoevzfizrwsdvdctxkrzlkaqmdbeqchnxuhitdczebntajmypyyoxcmdfcegpnxwcoyelfpppfiupzknpweyjkddeinihrakkguqfdyfsapabsykvaeqcgehwwkhjhfeumpfkdmeuptxoabccuwusteyjzonatqqejbcrndcaadeskdmdbrimrhnfradkdpbnyudldgiuboguwslgxczetqvmyhcjoqamgdzgmclemtimaoroartgbkwgnegxoordytopfsakgovafuclbjvcfypkpkoqlqysepkkaqmtcbwtnqkdbqddhzenqkneapjqxmboiaeifwivjqswfplbmtmvlqsbhhbgnrpaqaznoqiblvcvrylsmvvtuhlyvonb" ) else { fatalError() }
        guard solution.checkInclusion("voujinkwlkydjrmbehskvlulpwmdczrzefahwvyakbzjvawxzhqztqswqghubeqhzyuyufiwxqxtyefgxteihyprxbwdykssxadcybtcverkzifjlheqwnpfeckywhusbmqktjhjjsodaqzdsghhaysoilhlqfbgobbwztiouplfeborkkqpqrrcizyazsttjjyaonwsqcbmmafafsvqofypdxcxsjqufxpxokkqftvneezbpidaqdwiprzztzlhdnyxjzpfplrwksetmdjsoskolwammzedrgwbttgjiznopuuwbqqwlyhrpzrapujnyufljiuwjaanikjsfaohejygudydnlaiczmokjqzkxxdsaexxlddypwgfopyruqvfvawqhxvwwmkiekvkkmojunjzxwiqkigohuwtlqhotzrbhpbvxpczmsqjlhmwbfyzlhlpjeawcxkracgjqmcdmtbzvssvgnuhwroxgoihlgbaxmmakzxxsyvscycylsbaaemmsrifqfcssdhzguueblxomruathvmybhgenytgddikaaogkwssdibperbodtlerrnkrdqicgnzwfxaoeqmfovjfetzrvpcsgpeeytxpbtefkwjgmuydmebhxwafemwlncgkwayljyatmmanmpfakwdnmvjqppuknagllcoyixpykxmvykfrfrwmiitxwvzwgiikzwhyhekgsyqivdizzpemotanlmtofjlcilwntqwwumgamtwszhfwcicqeqbxlpaotqfrgbehfcooooreeztiznxevlnkhqhtoeabvuzaxyslvtvelysgashucyvocysscbacshieepypttkkgbyebsrlbyrbsdadnunzzkwbyzspxucoblwmkmtnsatssazxwivfzwifiecrwofdbcaazxdofglusktgrjivedhokzdvdhtreingnglymhujlxrakfesmtemxildrpxazibxxndxctkpvupwisazhbkitwmbejzhzvafhtaisvjjvzyivmdghrmduheifbvwwjypbcxflesxswzybfaauzklcmjfzvcwulzemnaozqvprubrdzotggqkbwfjbsiyacsqyrnqdthyhemowcbxdapfuoohskvnyjehjzvyrzgkjeenfxurfalblwaklfevbgeiniihdcgaskpaqkxakrxwtklffhfvgoetfxuvpjtstdhcuithgsgdtqwuqbwjdjxctttmfrhkliyaylsdvwzyrtwenotyfourzhkqidkzmoqfbpwnodcyjnsbksbqymnvuvudsqwfnykavdpnyszbwofjxdjfhihztefusfvjcrgmoehigqsqhhkfcaumjgxzjhinydrbgapdrnzxcljdjzlwfliwhbcvoajviehzpdvxvigvaxtlctrtsctcaizxghlukazxjahjpmhwbcdcqdmvdadsluekbwwhzxrqwopdcecvpryeljmwzjotlapnunnpslbkehezwztlcauadepikdljsunxisiajtiqtdazgtizxmnilfrvhmyojdddxzsuzfychpysdsicakzctydwuwfkehxnfijhnwvwxaundogctgqcuuqpbetoqhwvgrqslrlvtlqvzuqmllvcpuikqrqfivfcfjvfohzfmvkyqbcahaarcyacidsfdobrbgclxkuijwdaaxpdtjbzudxegdijfecmmobkqeioogpthtdpvuzjqciiyfikvgzbpozxpksgnfgmrfqqcufjuangtaayzrqnhhgcxrjgroqltxwzammhoxfcykalbsutmwptspfcriqbhsxhjjhqyayquztgpsjvxbctfzskvqnsaiprqqtfzlelkgthqfpbwyjxiddryedqejhjrmzadkzdcpcekvuyyvhwqgadsgrdvukdypufnotfutbnnvfntzqgglgbfxtbhzczzfhcyvfidpcpchysdbzoeodexitmbuksjbyffpxgvpwfpqkeccxpjweokjpxvtsutezxyqpbsxekeacpxqbuhjcbrmprgisuuxoxehopkhmaqojxvodzblpiegmjtrhbijhvrogimhdfzoxpnofyujwqqzarheceiiirmuflxhcfjxqmadisviqjfzkmccnydksegmnwfdxxbngudcwthnbhockycjnzolwpxfkljmffqjoljsqcorbciunavkgfubnjamqspijnoabmyjlrtkefaiceufpffvwnygcxwrthyqerjedqyvpwtezyrvojztrxcxqqywebiqxcmnzuavbnpdyigtsyeojvubqhvetoocfifxqqczmnhmbxcxoxfdmjopbalqrivjkcayonnolylghzkajbxnxzwmnfsszryatbdhlhmoobxkxrwiwuezhujdpvqhohuevcmmjufkbzqriivpxvgvvjyvaipoewijpptjgpzsetuywcnfljssallxikayhjrjyedrlyboracgykaooieezeeubbrzsvuovdprsjifpihmuwwrgjhufsdwwbhhrloolxencdaiwhwrmsaqyamuwmicdzoisnydtfnzwrwpbpwbxzmmtxtxufolxchlealeslcyiweakaoysvijfzmninpmbzeazbjvdyojoyalopdmpdstsymgksuacwsppdmnkiluwoqylyedzzsyhgpxfwyaldfabbstonesihlypcouswkfcywnrggzzkamrtedxyzivuystgiuospvywhqqezjcbnhwzvsoqsbcvccsdhakxcbffrimyiuobwszvccwcdmzknqkicshubettbrvutlhhheuqyjblhvrbabwresreuuzwaeqgaflvcbjmzbenfoekgigcgxawvgnhofkoibvapouamuywgxhivfcchfqiecpltnnebwhgenmnujcrotnrzzrntsrceqaubpcqggoqkzvqnyigbwotnxgehpvcioyevbfqbqodkjsxrkoseytzhhzdymdftgsssibzroetdvhlxsfvqnqwhtyeldmjqdpctdzxkgqkcfmsxanilktehbwcwtaixi", "oqupbcqazvlehlzjyamwlmpybilihvokonzhgqiyomtdxcfcjrvyvzbftvxhcntsavnfumzzozxwpzllomceexaxmablfcluylwwgxzzcrfbusucsdaqlfztvxbwyaygucnowcvvwukhghyzbbwmgvdtcqdvwgulezccmcdmkkftwzodzpnmxxkgmlclgitebyjmferxpnerphcvpvrypnyhvnazizzrmqlpjgkoucmyqdzbwpewgduarfrulybyrokbztghpxojkxespppqpqgnnxacqtzebeogoswbwitciuvqdrlpohhfsgsjhbtgxlegvkovpzdjabojfojubbuabdagjppdtuaevynopbeawkyfevuutdczkxwkkvuiabnkgnscyquirognkzkeeelfmjyljljiozzswkkcxqsajbitjscsnrdzpiuaatkvbfhufaowbdmtydklapdbwlxvxfmoagutecttrbdogxhlrzxbtqqnyzludvwenlrbqehfjkgkcbtnknxcpexgyrkjvfdygoyfzjlceirvhlqrxjgrqxwezwhgnhkrisazhwhzhqdywuorxgmnhbippzuvbarblpbnwznvwnwhmxotwxeadpdcpjelkxopwmizuqctxhoxxrdyaxbvzhrcdtsaaxzehxroqupdigxzdrpbkztvxpnjbnscxvcqxkgfaocyhjqkyxwyogbeoekjepufascoyohlbebqypwvfgvwynfwcpoazzowvbvawvrxovsebibgcuiegpclatcxfiydvpxbolcmwlmwsvryaicjdirggfqykoezcrvzcgcnppdswmxjizjxgvxsitnwbhpfhpvcnliaofdfpwiwylrlaawqljqzpgymhhoygtieqnmujcacvxgzawjvofxsohkmoahshwmgwdarcgbginnrtfekniliwkqxbobcwusprjgasjbppiofeexhgiuxcbhysqpmacufvzjcpbxpdldbvtwpszpwaabqbrhwuczdluybcaelvuhurjwoblkoclsnqpjosgivwiynczedalhpksdibfvuhzcolormvxsbeokfvsbogoubdtzrupvehtdqmewxddjmlnsikxfxudmjqcqhsxlfcxqmgzafpszejwunccnrqmlnuumlxemmrvluioeaqspsvfrbyjjcmlvchjhcvyqzoeqobjeinxdzzwiyinmirkzqndcpmmjpejujfgtcftmccsoarfxvjtdczpvfbgluqvpynqtqmsfpngqeyiimseuldmnjnnwtpuwyggdlybuvpoxfyayhovxzhtlbmsldorjckmywsmigdocgbpbysjrpnxpzafxvbzciasldrtbjsiygspavhalsdvecanlmcmihcmyebtciayyvugavrpcvnjernmaqxusslswgrqauuerjbswsppvsbyffltivkoqkacscyryboknnhbstpmffhvnbznevcmolwvsusmowvybevlyksceaokcnymmgfmmetsacabcsinnqltrxsdnqfseaziyvbecfbacwqimrdgrdwpxrsusmwnervyedswloinjzxfphuvtkvujknlizsxgqoiotniuflvufiftskingufhgvqewvjqbhpyuhgzidoloeibxzwagkpffzotyprkmzajvuahrevwuanmzrqiaoedmdiaghxuslncxunbudftxwipuzihldhcjndwtzqirbwjpqqpckxaweteotuoqtxjsrfzdbwriihvbtnlbtttlnvivfyhetdlvrkqvjqscclmaifqqrgkcegwpzffhfywfaireqazvtkqinfnkzzdhdxdjjnpzyqowacsjhmfrnowekxhnoesupsnatiivxtjphzdonrbvbyrlljyjwyjqkndvskaffacxzcwyfgnpgbrxyqpnwjwvixnjvjykagehbsyxwjvvtlhhxjtqejinhiuejjvnbomyolslaacwcnasyavbcvpiqjldhqenlsmesoauvwekeooaqtlfgtyfgettakefpeknxwmgpxpkkmksfdvrgofgnwgsgadnjwmaltbguxgkajsukrujbrgzpdqxgehheqgniwxvlzdpnmvffxtoiznttsspvrufkkpfhlyenaotplkkfwvojtjnyzitnhnebwthecknkpeevctgtxbbbmmrxdzyeuatgctejpnuljsuoosqhdtpmcbhpmzzbdvhphvurbvurfjbtcoxenxprlodvqgyyooougpnyqqcsauflkbzyatregubqyeemntuilwfbcozptqwszgaueuomxhhrotdqeelblnbmwmhfdbqvtalgfwcxlruqjuxjepurpqkwuxnlajjrfnugtexgdiyxocfeqrmlrrfggbxywbrrmhrablneshhdpxpggkmzfnwdcrkrybzwxngplkvftxjgxfgiuuomvusihtndwmfxialvoujinkwlkydjrmbehskvlulppmdczrzefahwvyakbzjvawxzhqztqswqghubeqhzyuyufiwxmxtyefgxteihyprxbwdykssxadcybtcverkzifjlheqwnpfeckywhusbmqktjhjjsodaqzdsghhaysoilhlqfbgobbwztiouplfeborkkqpqrrcizyazsnmjjyaonwsqcbmmafafsvqofypdxcxsjqufxpxokkqftvneezbpidaqdwiprzztzlhdnyxjzpfplrwksetmdjsoskolwammzedrgwbttgjiznopuuwbqqwlyhrpzrapujnyufljiuwjaanikjsfaohejygudydnlaiczmokjqzkxxdsaexxlddypwgfopyauqvfvawqhxvwwmkiekvkkmojunjzxwiqkigohuwtlqhotzrbhpbvxpczmsqjlhmwbfyzlhlpjeawcxkracgjqmcdmtbzvssvgnuhwroxgoihlgbaxmmakzxxsyvscycylsbaaemmsrifqfcssdhzguueblxomruathvmybhgenytgddikaaogkwssdibperbodtberrnkrdqicgnzwfxaoaqmfovjfetzrvpcsgpeeytxpbtefkwjgmuydmebhxwafemwlncgkwayljaatmmanmpfekwdtmvjqppuknagllcoyixpykxmvykfrfrwmiitxwvzwgiikzwhyhekgsyqivdizzwemotanlmtofjlcilwntqwwumgamtwszhfwcicqeqbxlpaotqfrgbehfcooooteeztiznxevlnkhqhtoerbvuzaxyslvtvelysgashucyvocysscbacshieepypttkkgbyebsrlbyrbsdadnunzzkwbyzspxecoblwmkmtnsatssazxwivfzwifiucrwofdbcaazxdofglusktgrjivedhokzdvdhtreingnglymhujlxrakfesmtetxildrpxazibxxndxctkpvuzwisazhbkitwmbejzhzvafhtaisvjjvzyivmdghrmduheifbvwwjypbcxflesxswzybfayuzklcmjfzvcwuazemnaozqvprubrdzotggqkbwfjbsiyacsqyrnqdthyhemowcbxdapfuoohskvnyjehjzvyrzskjeenfxurfalblwaklfevbgeiniihdcgaskpaqkxakrxwtklffhfvgoetfxuvpjrstdhcuithgsgdtqwuqbwjdjxctttmfrhkliyaylsdowzyrtwenotyfourzhkqidkzmoqfbpwnodcyjnsbksbqymnvuvudsqwfnykavdpnyszbwofjxdjfhihztefusfvjcrgmoehigqsqhhkfcauqjgxzjhinydrbgapdrnzxcljdjzlwfliwhbcvosjviehzpdvxvigvaxtlctrtsctcaizxghlukazxjahjpmhwbcdcqdmvdadsluekbwwhzxrqwopdcecvpryeljmwzjotlapnunnpslbkehepwztlcauadepikdljsunxisiajtiqtdazgtizxmnilfrvhmyojdddxzsuzfychpysdsiczkzctydwuwfkehxnfijhnwvwxaundogctgqcuuqpbewoqhwvgrqslrlvtlqvzuqmllvcpuikqrqdivfcfjvfohzfmvkyqbcahaarcyacidsfdobrbgclxkuijwdaaxpdtjbzudxegdijfecmmobbqeioogpthtdpvuzjqciiyfikvgzbpozxpksgnfgmrfqqcufjulngtaayzrqnhhgcxrjgroqltxwzammhoxfcykalbsutmwptspfcriqbhsxhjjhqyayquztgpsjvxbctfzskvqnsaiprqqtfzlelkgthqfpbwyjxiddryedqejhjrmzadkzdcpcekvuyyvhwqgadsgmdvukdypufnotfutlnnvfntzqzglgbfxtbhzczzfhcyvfidpcpchzsdbzoeodexitmbuksjbyffpxgvptfpqkeccxpjweokjpxvtsutezxyqpbsxekeacpxqbuhjcbrmprgisuuxoxehopkhmaqojxvodzblpiegmjtrhbijhvrogimhdfzoxpnofyujwqqzarheceiiirmuflxhcfjxqmadisviqjfzkmccnydksegmnwfdxxbngudcwthnbhockycjnzolwpxfkljmffqjoljsqcorbciunavkgfubnjamqspijnoabmyjlrtkefaiceufpffvwnygcxwrthyqerjedqyvpwtezyrvvjztrxcxqqywebiqbcmnzuavbnpdyigtsyeojvubqhvetoocfifxqqczmnhmbxcxoxfdmjopxalqrivjkcayonnolylghzkajbxnxzwmnfsszryatbdhlhmoobxkxrwiwuezhujdpvqhohuevcmmjufkbzqriivpxvgvvjyvaipoewijpptjgpzsetuywcnfljssallxikayhjrjyedrlyboracgykaooieegeeubbrzsvuovdprsjifpihmuwwrgjhufsdwwbhhrloolxencdaiwhwrmsaqyamuwmicdzoignydtfnzwrwpbpwbxzmmtxtxufolxchlealeslcyiweakaoysvijfzmninpmbzeazbjvdyojoyalopdmpdstsymgksuacwsppdmnkiluwoqylyedzzsyhgpxfwyaldfabbstonesihlypcouswkfcywnrggzzkamrtedxyzivuystgiuospvywhqqezjcbnhwyvsoqsbcvccadhakxcbffrimyiuobwszvccwcdmzknqkicshubettbrvutlhhheuqyjblhvrbabwresreuuzwaeqgaflvcbjmzbenfoekgigcgxawvgnhofkoikvapouamuywgxhivfcchfqiecpltnnebwhgenrnujcrotnrzzrntsrceqaubpcqggoqkzvqnyigbwotnxgehpvcioyevbfqbqodkjsxrkoseytzhhzdymfftgsssibaroetdvhlxsfvqnqwhtyeldmjqdpctdzxkgqkcfmsxanilktehbwcwtaixiefnhewlzmfeefpldmeptjjshxebbwrbmhrmybddxovkszadbyeqvrxncffozgozdrro") else { fatalError() }
        print("All tests passed")
    }
}

fileprivate final class Solution {
    // a helper for O(1) letter count access backed by an array
    private class CharacterCounter: Equatable {
        private(set) var letterCounts = Array(repeating: 0, count: 26)

        init(_ string: String) {
            for character in string {
                add(character)
            }
        }

        func reset() {
            letterCounts = Array(repeating: 0, count: 26)
        }

        func add(_ character: Character) {
            letterCounts[index(for: character)] += 1
        }

        func remove(_ character: Character) {
            letterCounts[index(for: character)] -= 1
        }

        func has(_ character: Character) -> Bool {
            letterCounts[index(for: character)] > 0
        }

        static func == (lhs: CharacterCounter, rhs: CharacterCounter) -> Bool {
            lhs.letterCounts == rhs.letterCounts
        }

        private func index(for character: Character) -> Int {
            Int(truncatingIfNeeded: (UnicodeScalar("\(character)")?.value ?? 0) - UnicodeScalar("a").value)
        }
    }

    // MARK: - V3

    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        func letterDistance(a: [Character: Int], b: [Character: Int]) -> Int {
            var distance = 0
            for character in Set(a.keys).union(Set(b.keys)) {
                if let countA = a[character], let countB = b[character] {
                    distance += abs(countA - countB)
                } else if let countA = a[character], b[character] == nil {
                    distance += countA
                } else if a[character] == nil, let countB = b[character] {
                    distance += countB
                }
            }
            return distance
        }

        if s1.isEmpty { return true }
        guard s1.count <= s2.count, !s2.isEmpty else { return false }

        let windowSize = s1.count
        let letterCount = s1.reduce(into: [Character: Int]()) { counts, letter in
            counts[letter, default: 0] += 1
        }
        var slidingWindow = s2[0..<windowSize].reduce(into: [Character: Int]()) { counts, letter in
            counts[letter, default: 0] += 1
        }
//        print("letterCount: \(letterCount)")
//        print("slidingWindow: \(slidingWindow)")

        var totalSkips = 0

        var i = 0
        while i <= s2.count - windowSize {
            //print("i: \(i), slidingWindow: \(slidingWindow)")
            if letterCount == slidingWindow {
                print("totalSkips: \(totalSkips)")
                return true
            }

            let letterDistance = letterDistance(a: letterCount, b: slidingWindow)
            let charactersToSkip = max(1, letterDistance / 2)
            print("charactersToSkip: \(charactersToSkip)")

            totalSkips += charactersToSkip

            for j in i..<i+charactersToSkip {
                if slidingWindow[Character(String(s2[j]))] == 1 {
                    slidingWindow[Character(String(s2[j]))] = nil // do not set to 0, otherwise dict comparison will fail
                } else {
                    slidingWindow[Character(String(s2[j])), default: 0] -= 1
                }
                if j + windowSize < s2.count {
                    slidingWindow[Character(String(s2[j + windowSize])), default: 0] += 1
                } else {
                    return false // the sliding window hits the boundary
                }

                //print("i: \(i), charactersToSkip: \(charactersToSkip), slidingWindow: \(slidingWindow)")
            }
            i += charactersToSkip

            //print("i: \(i), charactersToSkip: \(charactersToSkip), slidingWindow: \(slidingWindow)")
        }

        print("totalSkips: \(totalSkips)")

        return false
    }

    // MARK: - V2

    // Replace the v1 dictionary with the array-backed `CharacterCounter`, still slow and buggy
    func checkInclusion_v2(_ s1: String, _ s2: String) -> Bool {
        if s1.isEmpty { return true }
        guard s1.count <= s2.count, !s2.isEmpty else { return false }

        var i = 0
        var matchCount = 0 // number of consecutive matching characters while scanning s2
        let targetCounter = CharacterCounter(s1)
        let slidingCounter = CharacterCounter("")

        while i < s2.count {
            let currentCharacter = Character(String(s2[i]))
            if targetCounter.has(currentCharacter) {
                matchCount = min(matchCount + 1, s1.count)
                slidingCounter.add(currentCharacter)
                //print("\(currentCharacter) (i: \(i)), currentPermutation: \(currentPermutation)")
                if matchCount == s1.count {
                    if i >= s1.count {
                        // drop the out-out-window character
                        let letterToDrop = Character(String(s2[i - s1.count]))
                        slidingCounter.remove(letterToDrop)
                    }

                    if targetCounter == slidingCounter {
                        return true
                    }
                }
            } else {
                matchCount = 0
                slidingCounter.reset()
            }
            //print("\(currentCharacter) (i: \(i)), currentPermutation: \(currentPermutation)")
            i += 1
        }

        return false
    }

    // MARK: - V1

    // Too slow because the dictionary check happens on every character. Takes ~6s on MacBook Air 2010.
    func checkInclusion_v1(_ s1: String, _ s2: String) -> Bool {
        if s1.isEmpty { return true }
        guard s1.count <= s2.count, !s2.isEmpty else { return false }

        let letterCount = s1.reduce(into: [Character: Int]()) { counts, letter in
            counts[letter, default: 0] += 1
        }
        //print("letterCount: \(letterCount)")

        var i = 0
        var matchCount = 0 // number of consecutive matching characters while scanning s2
        var currentPermutation: [Character: Int] = [:] // for keeping track of the s2 scan

        while i < s2.count {
            let currentCharacter = Character(String(s2[i]))
            if letterCount[currentCharacter] != nil {
                matchCount = min(matchCount + 1, s1.count)
                currentPermutation[currentCharacter, default: 0] += 1
                //print("\(currentCharacter) (i: \(i)), currentPermutation: \(currentPermutation)")
                if matchCount == s1.count {
                    if i >= s1.count {
                        // drop the out-out-window character
                        let letterToDrop = Character(String(s2[i - s1.count]))
                        if let count = currentPermutation[letterToDrop] {
                            currentPermutation[letterToDrop] = max(0, count - 1)
                        }
                    }

                    if letterCount == currentPermutation {
                        return true
                    }
                }
            } else {
                matchCount = 0
                currentPermutation.removeAll()
            }
            //print("\(currentCharacter) (i: \(i)), currentPermutation: \(currentPermutation)")
            i += 1
        }

        return false
    }
}
