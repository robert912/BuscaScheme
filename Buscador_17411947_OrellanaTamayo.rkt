#lang racket


(define ListaStopWords '("a" "about" "above" "across" "after" "afterwards" "again" "against" "all" "almost" "alone" "along" "already" "also" "although" "always" "am" "among" "amongst" "amoungst" "amount" "an" "and" "another" "any" "anyhow" "anyone" "anything" "anyway" "anywhere" "are" "around" "as" "at" "back" "be" "became" "because" "become" "becomes" "becoming" "been" "before" "beforehand" "behind" "being" "below" "beside" "besides" "between" "beyond" "bill" "both" "bottom" "but" "by" "call" "can" "cannot" "cant" "co" "computer" "con" "could" "couldnt" "cry" "de" "describe" "detail" "do" "done" "down" "due" "during" "each" "eg" "eight" "either" "eleven" "else" "elsewhere" "empty" "enough" "etc" "even" "ever" "every" "everyone" "everything" "everywhere" "except" "few" "fifteen" "fify" "fill" "find" "fire" "first" "five" "for" "former" "formerly" "forty" "found" "four" "from" "front" "full" "further" "get" "give" "go" "had" "has" "hasnt" "have" "he" "hence" "her" "here" "hereafter" "hereby" "herein" "hereupon" "hers" "herse"" "him" "himse"" "his" "how" "however" "hundred" "i" "ie" "if" "in" "inc" "indeed" "interest" "into" "is" "it" "its" "itse"" "keep" "last" "latter" "latterly" "least" "less" "ltd" "made" "many" "may" "me" "meanwhile" "might" "mill" "mine" "more" "moreover" "most" "mostly" "move" "much" "must" "my" "myse"" "name" "namely" "neither" "never" "nevertheless" "next" "nine" "no" "nobody" "none" "noone" "nor" "not" "nothing" "now" "nowhere" "of" "off" "often" "on" "once" "one" "only" "onto" "or" "other" "others" "otherwise" "our" "ours" "ourselves" "out" "over" "own" "part" "per" "perhaps" "please" "put" "rather" "re" "same" "see" "seem" "seemed" "seeming" "seems" "serious" "several" "she" "should" "show" "side" "since" "sincere" "six" "sixty" "so" "some" "somehow" "someone" "something" "sometime" "sometimes" "somewhere" "still" "such" "system" "take" "ten" "than" "that" "the" "their" "them" "themselves" "then" "thence" "there" "thereafter" "thereby" "therefore" "therein" "thereupon" "these" "they" "thick" "thin" "third" "this" "those" "though" "three" "through" "throughout" "thru" "thus" "to" "together" "too" "top" "toward" "towards" "twelve" "twenty" "two" "un" "under" "until" "up" "upon" "us" "very" "via" "was" "we" "well" "were" "what" "whatever" "when" "whence" "whenever" "where" "whereafter" "whereas" "whereby" "wherein" "whereupon" "wherever" "whether" "which" "while" "whither" "who" "whoever" "whole" "whom" "whose" "why" "will" "with" "within" "without" "would" "yet" "you" "your" "yours" "yourself" "yourselves"))

(define ListaDocumentos '('(1
"experimental investigation of the aerodynamics of a
wing in a slipstream ."
"brenckman,m"
"j. ae. scs. 25, 1958, 324"
"experimental investigation of the aerodynamics of a
wing in a slipstream .
  an experimental study of a wing in a propeller slipstream was
made in order to determine the spanwise distribution of the lift
increase due to slipstream at different angles of attack of the wing
and at different free stream to slipstream velocity ratios .  the
results were intended in part as an evaluation basis for different
theoretical treatments of this problem .
  the comparative span loading curves, together with
supporting evidence, showed that a substantial part of the lift increment
produced by the slipstream was due to a /destalling/ or
boundary-layer-control effect .  the integrated remaining lift123
increment, after subtracting this destalling lift, was found to agree
well with a potential flow theory .
  an empirical evaluation of the destalling effects was made for
the specific configuration of the experiment")
'(2
"simple shear flow past a flat plate in an incompressible fluid of small
viscosity"
"ting-yili"
"department of aeronautical engineering, rensselaer polytechnic
institute
troy, n.y"
"simple shear flow past a flat plate in an incompressible fluid of small
viscosity .
in the study of high-speed viscous flow past a two-dimensional body it
is usually necessary to consider a curved shock wave emitting from the
nose or leading edge of the body .  consequently, there exists an
inviscid rotational flow region between the shock wave and the boundary
layer .  such a situation arises, for instance, in the study of the
hypersonic viscous flow past a flat plate .  the situation is somewhat
different from prandtl's classical boundary-layer problem . in prandtl's
original problem the inviscid free stream outside the boundary layer is
irrotational while in a hypersonic boundary-layer problem the inviscid
free stream must be considered as rotational .  the possible effects of
vorticity have been recently discussed by ferri and libby .  in the
present paper, the simple shear flow past a flat plate in a fluid of small
viscosity is investigated .  it can be shown that this problem can again
be treated by the boundary-layer approximation, the only novel feature
being that the free stream has a constant vorticity .  the discussion
here is restricted to two-dimensional incompressible steady flow")
'(3
"the boundary layer in simple shear flow past a flat plate"
"m. b. glauert"
"department of mathematics, university of manchester, manchester,
england"
"the boundary layer in simple shear flow past a flat plate .
the boundary-layer equations are presented for steady
incompressible flow with no pressure gradient")
'(4
"approximate solutions of the incompressible laminar
boundary layer equations for a plate in shear flow"
"yen,k.t"
"j. ae. scs. 22, 1955, 728."
"approximate solutions of the incompressible laminar
boundary layer equations for a plate in shear flow .
  the two-dimensional steady boundary-layer
problem for a flat plate in a
shear flow of incompressible fluid is considered .
solutions for the boundary-
layer thickness, skin friction, and the velocity
distribution in the boundary
layer are obtained by the karman-pohlhausen
technique .  comparison with
the boundary layer of a uniform flow has also
been made to show the effect of
vorticity")
'(5
"one-dimensional transient heat conduction into a double-layer
slab subjected to a linear heat input for a small time
internal"
"wasserman,b."
"j. ae. scs. 24, 1957, 924."
"one-dimensional transient heat conduction into a double-layer
slab subjected to a linear heat input for a small time
internal .
  analytic solutions are presented for the transient heat
conduction in composite slabs exposed at one surface to a
triangular heat rate .  this type of heating rate may occur, for
example, during aerodynamic heating")))

(define doc '('(1 "titulo1" "autores1" "biblio1" "texto numero uno")
              '(2 "titulo2" "autores2" "biblio2" "texto numero dos")
              '(3 "titulo3" "autores3" "biblio3" "texto numero tres")
              '(4 "titulo4" "autores4" "biblio4" "texto numero cuatro"))
  )

;REPRESENTACION: La representacion elegida es una lista de y listas (matriz dispersa) que tienen  x elementos dentro (palabra y n° de palabras por doc)
;se elige esta representacion por su simplicidad y la capacidad de poder analizar la palabra y la cantidad de insidencias en cada documento de manera rapida.



;CONSTRUCTORES

;2) CreateIndex
;Funcion que me permite crear un Indice, recibe como parametros una lista con listas de documentos y retorna una lista de lista
;donde el primer elemento de la lista es la palabra y el resto de la lista representa a al Indice disperso de cada documento, recursión lineal
;.........(createIndex ListaDocumentos ListaStopWords)
(define(createIndex documents stopwords)
  (define (contadorpalabra palabrasIndice documentos);contiene todas las palabras del indice, y todo el documento separado por palabras
    (if(null? palabrasIndice)
       null
       (cons (cons (car palabrasIndice)(entregadoc (car palabrasIndice) documentos))(contadorpalabra (cdr palabrasIndice) documentos))
       )
    )
  (contadorpalabra (palabrasIndex documents stopwords) (index documents stopwords))
  )

;Funcion que entrega todas las palabras que componen el Indice, recursión de cola
(define (palabrasIndex documentos stopwords)
  (define (palabrasIndex documentos Index)
    (if (null? documentos)
        (reverse Index)
        (if (equal? #f (quitastopword (car documentos) Index))
            (palabrasIndex (cdr documentos) (cons (car documentos) Index))
            (palabrasIndex (cdr documentos) Index)
            ) 
        )
    )
  (palabrasIndex (unirdoc (index documentos stopwords)) null)
  )

;funcion que recibe una lista de documentos y una lista de Stopwords, retorna todas las palabras del documento sin las palabras comunes.
;recursión lineal...............................  (documento (car(cdr(car doc))) ListaStopWords)
(define (documento doc stopwords)
  (if (null? (cdr doc))
      null
      (append (palabrasindex (separador (car (cdr doc))) stopwords) (documento (cdr doc) stopwords))
      )
  )



;FUNCIONES DE PERTENENCIA

;funcion que comprueba si una palabra pertenece a las palabras comunes (Stopwords)
;recibe como argumento la palabra y la lista de Stopwords, si no pertenece, retorna False, si la encuentra retorna True
;............................................ (quitastopword "the" ListaStopWords)
(define (quitastopword palabra listopwords)
  (if (null? listopwords)
      #f
      (if (or (equal? palabra (car listopwords))(equal? palabra "."))
          #t                  
          (quitastopword palabra (cdr listopwords))
          )
      )
  )



;SELECTORES

;funcion que me permite encontrar el inicio y final de cada palabra, recursión lineal ////...... (palabras "hola a todo el mundo")
;recibe como argumento un texto(string) con todas palabras y retorna una lista con el numero de inicio y final de cada palabra 
(define (palabras texto)
  (define (palabras texto n)
    (if (< n (string-length texto))
        (cond [(or (equal? #\space (string-ref texto n))(equal? #\newline (string-ref texto n))(equal? #\, (string-ref texto n))(equal? #\- (string-ref texto n)))
               (cons n (cons (+ n 1) (palabras texto (+ n 1))))]
              [(= n 0)(cons n (palabras texto (+ n 1)))]
              [(= (+ n 1) (string-length texto))(cons (+ n 1) (palabras texto (+ n 1)))]
              (else (palabras texto (+ n 1)))
              )
        null
        )
    )
  (palabras texto 0)
  )

;contador de palabras para el indice disperso en cada documento, recursión de cola
(define (contador palabra doc n)
  (if(null? doc)
     n
     (if(equal? palabra (car doc))
        (contador palabra (cdr doc) (+ n 1))
        (contador palabra (cdr doc) n)
        )
     )
  )

;entrega documentos para revisar si contiene la palabra y retorna el indice disperso (ej:'(0 2 1 3)), recursión lineal
(define (entregadoc palabra docs)
    (if (null? docs)
        null
        (cons (contador palabra (car docs) 0)(entregadoc palabra (cdr docs)))
        )
   )

;funcion que me permite sacar cada palabra del string gracias a la lista que contiene el inicio y final de cada palabra
;recibe como argumento un texto (string de palabras) y una lista con el inicio y el final de cada palabras,recursión lineal
;///// (comparador "hola a todo el mundo" '(0 4 5 6 7 11 12 14 15 20))
(define (comparador texto listpal)
  (if (null? listpal)
      null
      (cons (substring texto (car listpal)(car (cdr listpal)))(comparador texto (cdr(cdr listpal))))
      )
  )

;3) TermQuery
;funcion que me permite hacer la consulta de un termino, recibe como argumeto el Indice, un termino (string) y el documento
;retorna una lista con lista de documentos y cada documento con sus respectivos RankValue
;...............(termQuery (createIndex ListaDocumentos ListaStopWords) "wing" ListaDocumentos)
(define (termQuery index term documents)
  (if (null? index)
      null
      (if (equal? term (car (car index)))
          (contienepal (cdr (car index)) documents)
          (termQuery (cdr index) term documents)
          )
      )
  )

;funcion que revisa en el indice disperso si hay algun valor mayor que 0, si existe concatena el RankValue con el documento
;recursión lineal
(define (contienepal index doc)
  (if (null? index)
      null
      (if (> (car index) 0)
          (cons (cons (car index) (car (cdr (car doc))))(contienepal (cdr index) (cdr doc)))
          (contienepal (cdr index) (cdr doc))
          )
      )
  )

;4) PhraseQuery
;Funcion que me permite consultar frase y me retorna los documentos que contienen las palabras de esa frase, recursión de cola
;....(phraseQuery (createIndex ListaDocumentos ListaStopWords) ListaStopWords "rate england of wing the must" ListaDocumentos)
;
(define (phraseQuery index stopwords phrase documents)
  (define (entregaphrase index listpalabra result)
    (if(null? listpalabra)
       result
       (entregaphrase index (cdr listpalabra)(buscarphrase index (car listpalabra) result))
       )
    )
  (contienepal(entregaphrase index (palabrasindex (separador phrase) stopwords)(lista0 (length documents))) documents)
  )



;MODIFICADORES

;funcion que comprueba todas las palabras de un texto y las compara con las Stopwords
;los argumentos son dos listas (lista de palabras de documentos y lista de Stopwords),
;retorna una lista de palabras de cada documento limpia, sin palabras comunes, recursión lineal
;.............. (palabrasindex (separador(car(cdr(cdr(cdr(cdr(car(cdr(car ListaDocumentos)))))))))ListaStopWords)
(define (palabrasindex listexto listopwords)
  (if (null? listexto)
      null
      (if (equal? #f (quitastopword (car listexto) listopwords))
          (cons (car listexto) (palabrasindex (cdr listexto) listopwords))
          (palabrasindex (cdr listexto) listopwords)
          )
      )
  )

;funcion que recibe como argunmento una lista Index, una lista de palabras y una lista de resultados
;si existe un match entre la palabar del Index y la palabra de la frase ingresada suma el resultado de los Indice
;a traves de la funcion Lambda, recursión lineal//........(buscarphrase (createIndex ListaDocumentos ListaStopWords) "wing" '(0 0 0 0 0))
(define (buscarphrase index phrase result)
  (if (null? index)
      result
      (if (equal? phrase (car(car index)))
          (map (lambda (L1 L2) (+ L1 L2)) (cdr (car index)) result)
          (buscarphrase (cdr index) phrase result)
          )
      )
  )



;OTRAS FUNCIONES

;funcion que me permite separa un texto................. (separador "hola a todo el mundo")
;recibe como argumento un texto(string de palabras) y los separa en palabras de string
;(separador(car(cdr(cdr(cdr(cdr(car(cdr(car ListaDocumentos)))))))))
(define (separador texto)
  (comparador texto (palabras texto))
  )

;funcion que recibe como argumento una lista todos los documentos y una lista con todos los Stopwords
;retorna una lista de listas con todas las palabras de cada documento, recursión lineal
(define (index documentos stopwords)
  (if (null? documentos)
      null
      (cons (documento (car (cdr (car documentos))) stopwords) (index (cdr documentos) stopwords))
      )
  )

;(unirdoc concaneta dos listas de palabras para dejar una sola lista,recursión lineal
(define (unirdoc doc)
  (if (null? doc)
      null
      (append (car doc)(unirdoc (cdr doc)))
      )
  )

;funcion que recibe como arg la cantidad de doc, crea una lista '((n = 0) = numero de documentos, recursión lineal            
(define (lista0 n)
  (if (= n 0)
      null
      (cons 0 (lista0 (- n 1)))
      )
  )

;5) Ranking
;funcion que ordena ascendente o descendente dependiendo del parametro(arg) de entrada
;(ranking (phraseQuery (createIndex ListaDocumentos ListaStopWords) ListaStopWords "rate england of wing the must" ListaDocumentos) 1)
(define (ranking results orderType)
 (if(= orderType 1)
    (sort results (lambda (X Y)(> (car X) (car Y))))
    (reverse(sort results (lambda (X Y)(> (car X) (car Y)))))
    )
  )

;6) Results->String
;Funcion que me permite visualizar los documentos encontrados por pantalla, recibe como argumento los resultados ordenados por Ranking (lista de listas)
;(Results->String(ranking (phraseQuery (createIndex doc ListaStopWords) ListaStopWords "cuatro of titulo2 texto dos the uno" doc)1))
;(Results->String(ranking (phraseQuery (createIndex ListaDocumentos ListaStopWords) ListaStopWords "rate england of wing the must" ListaDocumentos) 1))
;recursión de cola
(define (Results->String results)
  (print->doc (car results)0)
  (if(null? (cdr results))
     (display "\n")
     (Results->String (cdr results))
     )
  )     

;Funcion que imprime un documento, recibe como argumento 1 lista documento, ;recursión de cola
(define (print->doc doc n)
  (if (null? doc)
      (display "\n")
      (cond [(= n 0)(display "* Contiene ") (display(car doc)) (display " similitud con la(s) palabra(s) en el documento \n")(print->doc (cdr doc) (+ n 1))]
            [(= n 1)(display "* Documento: " )(display(car doc)) (display "\n")(print->doc (cdr doc) (+ n 1))]
            [(= n 2)(display "* Titulo: " )(display(car doc)) (display "\n")(print->doc (cdr doc) (+ n 1))]
            [(= n 3)(display "* Autores: ")(display(car doc)) (display "\n")(print->doc (cdr doc) (+ n 1))]
            [(= n 4)(display "* Bibliografia: ")(display(car doc)) (display "\n")(print->doc (cdr doc) (+ n 1))]
            [(= n 5)(display "* Texto: ")(display(car doc)) (display "\n")(print->doc (cdr doc) (+ n 1))]
            )
      )
  )
 

;.........................................................................................................
;2) CreateIndex
;(createIndex ListaDocumentos ListaStopWords)
;(createIndex doc ListaStopWords)

;3) TermQuery
;(termQuery (createIndex ListaDocumentos ListaStopWords) "wing" ListaDocumentos)
;(termQuery (createIndex ListaDocumentos ListaStopWords) "shear" ListaDocumentos)
;(termQuery (createIndex doc ListaStopWords) "tres" doc)

;4) PhraseQuery
;(phraseQuery (createIndex ListaDocumentos ListaStopWords) ListaStopWords "must england rate of wing" ListaDocumentos)
;(phraseQuery (createIndex ListaDocumentos ListaStopWords) ListaStopWords "small example of the body in a web page" ListaDocumentos)
;(phraseQuery (createIndex doc ListaStopWords) ListaStopWords "cuatro titulo2 of dos texto uno" doc)

;5) Ranking
;(ranking (termQuery (createIndex ListaDocumentos ListaStopWords) "shear" ListaDocumentos) 1)
;(ranking (phraseQuery (createIndex ListaDocumentos ListaStopWords) ListaStopWords "must england rate of wing" ListaDocumentos) 2)
;(ranking (phraseQuery (createIndex doc ListaStopWords) ListaStopWords "cuatro titulo2 of dos texto uno" doc) 1)

;6) Results->String
;(Results->String (ranking (termQuery (createIndex ListaDocumentos ListaStopWords) "shear" ListaDocumentos)1))
;(Results->String (ranking (phraseQuery (createIndex ListaDocumentos ListaStopWords) ListaStopWords "must england rate of wing" ListaDocumentos) 2))
;(Results->String (ranking (phraseQuery (createIndex doc ListaStopWords) ListaStopWords "cuatro titulo2 of dos texto uno" doc) 1))