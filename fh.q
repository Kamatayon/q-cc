//fakeResponse:{
//    c:rand 1+til 5;
//    ([] sym:c#0N?`btc`monero`ethereum`cardano`litecoin;cc:c?10.0)}
//
//h: hopen `::5001
//
//.z.ts:{neg[h] fakeResponse[]}
//
//system "t 1000"

system "l ws-client_0.2.2.q"

h:hopen `::5010
upd: {d:.j.k x;
      dt: `timestamp$(d[`timestamp]*1000000) + 1970.01.01D00:00;
      sym: `$d[`base];
      quote: `$d[`quote];
      price: `float$d[`priceUsd];
      direction: `$d[`direction];
      volume: `float$d[`volume];
      neg[h](".u.upd";`trades; enlist each (`timespan$dt; sym; `date$dt; quote; price; direction; volume))}
w:.ws.open["wss://ws.coincap.io/trades/binance"; `upd] // export SSL_VERIFY_SERVER=NO