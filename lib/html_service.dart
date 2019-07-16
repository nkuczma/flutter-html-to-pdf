class HtmlService {
  String name;
  HtmlService(this.name);
  
  String returnFirstPage() {
   return """
    <html>
      <head>
        <style>

        .page {
          padding: 10px 40px;
        }
        .container {
          display: flex;
          flex-flow: column;
        }
        .container .row {
          display: flex;
          flex-flow: row;
          
        }
        .container .row div {
          flex: 1;
          display: flex;
          flex-flow: column;
        }
        .container .row div:first-child {
          height: 50px;
          justify-content: space-evenly;
        }

        .container .row div:nth-child(2) {
          justify-content: center;
        }
        p {
          margin: 0;
        }
        .container .row div p:first-child {
          font-size: 18px;
          text-decoration: underline;
        }
        </style>
      </head>
      <body>
        <div class="page">
          <h2>Polecenie wyjazdu służbowego</h2>
          <h3>Misc allowance</h3>
          <div class="container">
            <div class="row">
              <div>
                <p>Data zlecenia wyjazdu</p>
                <p>Date of order</p>
              </div>
              <div>29.09.09</div>
            </div>

            <div class="row">
              <div>
                <p>Imię i nazwisko</p>
                <p>Name and Surname</p>
              </div>
              <div>${name}</div>
            </div>

            <div class="row">
              <div>
                <p>Kraj/Miasto</p>
                <p>Country/City</p>
              </div>
              <div>Norway/Oslo</div>
            </div>

            <div class="row">
              <div>
                <p>Kontrahent</p>
                <p>Customer</p>
              </div>
              <div>Making Waves AS</div>
            </div>

            <div class="row">
              <div>
                <p>Cel podróży</p>
                <p>Purpose of the trip</p>
              </div>
              <div>Training</div>
            </div>

            <div class="row">
              <div>
                <p>Numer projektu</p>
                <p>Project number</p>
              </div>
              <div>2020</div>
            </div>

            <div class="row">
              <div>
                <p>Czas wyjazdu (daty: od...do...)</p>
                <p>Travel dates(from...to...)</p>
              </div>
              <div>01.02.2019 - 07.02.2019</div>
            </div>

            <div class="row">
              <div>
                <p>Środek komunikacji</p>
                <p>Means of transport</p>
              </div>
              <div>Samolot</div>
            </div>

          </div>
        </div>
      </body>
    </html>
    """;

    }
}