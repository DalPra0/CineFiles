//
//  Filme.swift
//  desafio-structs
//
//  Created by Lucas Dal Pra Brascher on 29/05/25.
//


import Foundation

struct Filme: Identifiable {
    var id = UUID()
    
    var titulo: String
    var sinopse: String
    var direcao: String
    var roteiristas: String
    var ano: Int
    var imagem: String
    var isFavorito: Bool
    var visto: Bool
    var isFilmeMonitoria: Bool
    var showSheet: Bool = false
    
}

extension Array where Element == Filme {
    static func filmes() -> [Filme] {
        [
            Filme(
                titulo: "Tudo em Todo o Lugar ao Mesmo Tempo",
                sinopse: "Uma imigrante chinesa de meia idade se envolve em uma aventura louca, onde só ela pode salvar o mundo explorando outros universos que se conectam com as vidas que ela poderia ter levado",
                direcao: "Daniel Kwan, Daniel Scheinert",
                roteiristas: "Daniel Kwan, Daniel Scheinert",
                ano: 2022,
                imagem: "tudo-em-todo-lugar",
                isFavorito: false,
                visto: false,
                isFilmeMonitoria: true
            ),
            Filme(
                titulo: "Cisne Negro",
                sinopse: "Uma esforçada bailarina luta para manter sua sanidade após obter o papel principal no Lago dos Cisnes de Tchaikovsky.",
                direcao: "Darren Aronofsky",
                roteiristas: "Mark Heyman, Andres Heinz, John J. McLaughlin",
                ano: 2010,
                imagem: "cisne-negro",
                isFavorito: false,
                visto: false,
                isFilmeMonitoria: true


            ),
            Filme(
                titulo: "Barbie a princesa e a plebeia",
                sinopse: "Uma plebeia, moradora de um vilarejo, é muito parecida com a princesa do reino. Os destinos das duas se cruzam quando a princesa é sequestrada, e a moça humilde usa sua incrível semelhança com ela para tentar salvar das mãos do vilão.",
                direcao: "William Lau",
                roteiristas: "Cliff Ruby, Elana Lesser, Ruth Handler",
                ano: 2004,
                imagem: "barbie-princesa-plebeia",
                isFavorito: false,
                visto: false,
                isFilmeMonitoria: true


            ),
            Filme(
                titulo: "Show de Truman",
                sinopse: "Truman Burbank é um pacato vendedor de seguros que leva uma vida simples com sua esposa Meryl Burbank. Porém, algumas coisas ao seu redor fazem com que ele passe a estranhar sua cidade, seus supostos amigos e até sua mulher. Após conhecer a misteriosa Lauren, ele fica intrigado e acaba descobrindo que toda sua vida foi monitorada por câmeras e transmitida em rede nacional.",
                direcao: "Peter Weir",
                roteiristas: "Peter Weir, Andrew Niccol",
                ano: 1998,
                imagem: "show-de-truman",
                isFavorito: false,
                visto: false,
                isFilmeMonitoria: true


            ),
            Filme(
                titulo: "Spirit: O Corcel Indomável",
                sinopse: "Animação sobre a amizade entre um menino indígena e um cavalo indomável apaixonado por uma égua. Ambientada no Velho Oeste americano, mostra o impacto do processo civilizatório na vida dos três e também na amizade que construíram.",
                direcao: "Kelly Asbury, Lorna Cook",
                roteiristas: "John Fusco",
                ano: 2002,
                imagem: "spirit-corcel-indomavel",
                isFavorito: false,
                visto: false,
                isFilmeMonitoria: true


            ),
            Filme(
                titulo: "Labirinto do Fauno",
                sinopse: "Em 1944, na Espanha, a jovem Ofélia e sua mãe doente chegam ao posto do novo marido de sua mãe, um sádico oficial do exército que está tentando reprimir uma guerrilheira. Enquanto explorava um labirinto antigo, Ofélia encontra o Pan fauno, que diz que a menina é uma lendária princesa perdida e que ela precisa completar três tarefas perigosas a fim de se tornar imortal.",
                direcao: "Guillermo del Toro",
                roteiristas: "Guillermo del Toro",
                ano: 2006,
                imagem: "labirinto-do-fauno",
                isFavorito: false,
                visto: false,
                isFilmeMonitoria: true


            ),
            Filme(
                titulo: "O Predestinado",
                sinopse: "Um agente precisa viajar no tempo para impedir a ação de um criminoso responsável por um ataque que mata milhares de pessoas.",
                direcao: "Michael Spierig, Peter Spierig",
                roteiristas: "Michael Spierig, Peter Spierig, Robert A Heinlein",
                ano: 2015,
                imagem: "o-predestinado",
                isFavorito: false,
                visto: false,
                isFilmeMonitoria: true


            ),
            Filme(
                titulo: "Gigantes de aço",
                sinopse: "Em um futuro próximo, as máquinas substituem os homens no ringue. As lutas de boxe acontecem entre robôs de alta tecnologia. Charlie, um ex-lutador frustrado, decide se juntar ao filho para construir um competidor imbatível.",
                direcao: "Shawn Levy",
                roteiristas: "Dan Gilroy, Les Bohem, Jeremy Leven, John Gatins, Richard Matheson",
                ano: 2011,
                imagem: "gigantes-de-aco",
                isFavorito: false,
                visto: false,
                isFilmeMonitoria: true


            ),
            Filme(
                titulo: "A vastidão da noite",
                sinopse: "Duas crianças procuram a fonte de uma misteriosa frequência que surgiu em sua cidade.",
                direcao: "Andrew Patterson",
                roteiristas: "James Montague, Craig W. Sanger",
                ano: 2019,
                imagem: "vastidao-da-noite",
                isFavorito: false,
                visto: false,
                isFilmeMonitoria: true


            ),
            Filme(
                titulo: "Parasita",
                sinopse: "Toda a família de Ki-taek está desempregada, vivendo em um porão sujo e apertado. Por obra do acaso, ele começa a dar aulas de inglês para uma garota de família rica. Fascinados com a vida luxuosa destas pessoas, pai, mãe e filhos bolam um plano para se infiltrar também na abastada família, um a um. No entanto, os segredos e mentiras necessários à ascensão social cobram o seu preço.",
                direcao: "Bong Joon-ho",
                roteiristas: "Bong Joon-ho, Jin Won Han",
                ano: 2019,
                imagem: "parasita",
                isFavorito: false,
                visto: false,
                isFilmeMonitoria: true


            ),
            Filme(
                titulo: "Passivonas",
                sinopse: "Duas alunas não populares do último ano do ensino médio criam um clube da luta para tentar impressionar e conquistar líderes de torcida.",
                direcao: "Emma Seligman",
                roteiristas: "Emma Seligman, Rachel Sennott",
                ano: 2023,
                imagem: "passivonas",
                isFavorito: false,
                visto: false,
                isFilmeMonitoria: true


            ),
            Filme(
                titulo: "Turma da Mônica: Uma Aventura no Tempo",
                sinopse: "Franjinha está construindo uma máquina do tempo e precisa reunir moléculas dos quatro elementos: ar, água, fogo e terra. Mônica joga Sansão e, sem querer, acerta o aparelho, espalhando os elementos. Agora a turma precisa consertá-la.",
                direcao: "Mauricio de Sousa",
                roteiristas: "Mauricio de Sousa, Flávio de Souza, Didi Oliveira, Emerson Bernardo de Abreu",
                ano: 2007,
                imagem: "turma-monica-aventura-tempo",
                isFavorito: false,
                visto: false,
                isFilmeMonitoria: true


            ),
            Filme(
                titulo: "Amnésia (Memento)",
                sinopse: "Leonard está caçando o homem que estuprou e matou sua esposa. Ele tem dificuldades em encontrar o assassino pois sofre de uma forma intratável de perda de memória. Mesmo que ele possa lembrar detalhes da vida antes do acidente, Leonard não consegue lembrar o que aconteceu quinze minutos atrás, onde está indo ou a razão.",
                direcao: "Christopher Nolan",
                roteiristas: "Christopher Nolan, Jonathan Nolan",
                ano: 2001,
                imagem: "memento",
                isFavorito: false,
                visto: false,
                isFilmeMonitoria: true


            ),
            Filme(
                titulo: "Os Excêntricos Tenenbaums",
                sinopse: "Royal e sua esposa Etheline tiveram três filhos muito diferentes entre si, mas igualmente bem-sucedidos. Quando Etheline resolve se casar com outro, o irresponsável e excêntrico Royal resolve lutar por seu amor reunindo toda a família.",
                direcao: "Wes Anderson",
                roteiristas: "Wes Anderson, Owen Wilson",
                ano: 2002,
                imagem: "excentricos-tenenbaums",
                isFavorito: false,
                visto: false,
                isFilmeMonitoria: true


            ),
            Filme(
                titulo: "La La Land",
                sinopse: "O pianista Sebastian conhece a atriz Mia, e os dois se apaixonam perdidamente. Em busca de oportunidades para suas carreiras na competitiva Los Angeles, os jovens tentam fazer o relacionamento amoroso dar certo, enquanto perseguem fama e sucesso.",
                direcao: "Damien Chazelle",
                roteiristas: "Damien Chazelle",
                ano: 2017,
                imagem: "la-la-land",
                isFavorito: false,
                visto: false,
                isFilmeMonitoria: true


            ),
            Filme(
                titulo: "Os Serviços de Entrega da Kiki",
                sinopse: "Por ordem de sua mãe, Kiki parte para um aprendizado de um ano, acompanhada por seu gato preto. A um comando de sua vassoura mágica, ela vai parar na charmosa cidadezinha de Moreoastal. Infelizmente, os hotéis locais não aceitam bruxas e a polícia a flagra fazendo algumas travessuras.",
                direcao: "Hayao Miyazaki",
                roteiristas: "Hayao Miyazaki, Jack Fletcher, John Semper",
                ano: 1990,
                imagem: "kiki-servicos-entrega",
                isFavorito: false,
                visto: false,
                isFilmeMonitoria: true


            ),
            Filme(
                titulo: "O Feitiço de Áquila",
                sinopse: "O ladrão Gaston escapa da masmorra medieval de Aquila através da latrina. Os soldados estão prestes a matá-lo quando Navarra o salva. Navarra, viajando com seu falcão animado, planeja matar o bispo de Áquila com a ajuda de Gaston.",
                direcao: "Richard Donner",
                roteiristas: "Michael Thomas, Tom Mankiewicz",
                ano: 1985,
                imagem: "feitico-de-aquila",
                isFavorito: false,
                visto: false,
                isFilmeMonitoria: true


            ),
            Filme(
                titulo: "Os Incríveis",
                sinopse: "Depois do governo banir o uso de superpoderes, o maior herói do planeta, o Sr. Incrível, vive de forma pacata com sua família. Apesar de estar feliz com a vida doméstica, o Sr. Incrível ainda sente falta dos tempos em que viveu como super-herói, e sua grande chance de entrar em ação novamente surge quando um velho inimigo volta a atacar. Só que agora ele precisa contar com a ajuda de toda a família para vencer o vilão.",
                direcao: "Brad Bird",
                roteiristas: "Brad Bird",
                ano: 2004,
                imagem: "os-incriveis",
                isFavorito: false,
                visto: false,
                isFilmeMonitoria: true


            ),
            Filme(
                titulo: "Sociedade dos poetas mortos",
                sinopse: "O novo professor de Inglês John Keating é introduzido a uma escola preparatória de meninos que é conhecida por suas antigas tradições e alto padrão. Ele usa métodos pouco ortodoxos para atingir seus alunos, que enfrentam enormes pressões de seus pais e da escola. Com a ajuda de Keating, os alunos Neil Perry, Todd Anderson e outros aprendem como não serem tão tímidos, seguir seus sonhos e aproveitar cada dia.",
                direcao: "Peter Weir",
                roteiristas: "Tom Schulman",
                ano: 1989,
                imagem: "sociedade-poetas-mortos",
                isFavorito: false,
                visto: false,
                isFilmeMonitoria: false


            ),
            Filme(
                titulo: "O silêncio dos inocentes",
                sinopse: "A agente do FBI Clarice Starling é designada para entrevistar o assassino em série Hannibal Lecter, que está preso em uma cela de segurança máxima. Ela espera que ele ajude a capturar outro serial killer conhecido como Buffalo Bill, que sequestra e mata mulheres jovens.",
                direcao: "Jonathan Demme",
                roteiristas: "Ted Tally, Thomas Harris",
                ano: 1991,
                imagem: "silencio-dos-inocentes",
                isFavorito: false,
                visto: false,
                isFilmeMonitoria: false


            ),
            
            Filme(
                titulo: "Pânico",
                sinopse: "Sidney Prescott está tentando lidar com a morte de sua mãe um ano após o crime. Enquanto isso, uma série de assassinatos começa a acontecer na cidade, e Sidney se vê no meio de uma nova onda de terror.",
                direcao: "Wes Craven",
                roteiristas: "Kevin Williamson",
                ano: 1997,
                imagem: "panico",
                isFavorito: false,
                visto: false,
                isFilmeMonitoria: false


            ),
            
            Filme(
                titulo: "The Rocky Horror Picture Show",
                sinopse: "Um casal de noivos, Brad e Janet, fica preso em uma tempestade e acaba procurando abrigo em um castelo. Lá, eles são recebidos por um cientista excêntrico que está realizando uma experiência para criar o homem perfeito.",
                direcao: "Jim Sharman",
                roteiristas: "Jim Sharman, Richard O'Brien",
                ano: 1975,
                imagem: "rocky-horror-picture-show",
                isFavorito: false,
                visto: false,
                isFilmeMonitoria: false

            )
            
            
        ]
    }
}
