# LocalFood

## Model
[네이버 지역명물](https://shopping.naver.com/fresh/localfood/home)

## Service Scenario
- 지역 명물 상점들의 상품들이 나열된다.
- 고객이 상점에 들어가 상품을 주문한다.
- 주문내역이 입점 상인한테 전달된다.
- 상품 준비가 완료되면 택배사에 전달한다.
- 고객은 상품을 받아본다.


## Scenario Requirements
- 고객은 배송전에 주문을 취소할 수 있다.
- 주문/배송 상태는 지속하여 반영된다.
- 고객은 주문/배송 상태를 확인할 수 있다.


## Development Requirements
- 주문/결제는 동기, 이외에는 비동기로 호출한다.
- 인기있는 상점에 트래픽 병목 현상 발생시 다른 상점은 주문이 가능해야한다.
- 지역 명물 상점들은 빠르게 불러올 수 있어야한다.



