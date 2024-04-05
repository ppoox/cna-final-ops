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


## Architecture
![architecture](https://github.com/ppoox/cna-final-ops/assets/28284285/a958627c-12ea-4949-94ef-dca2c3779fc3)


## Event Storming
![event-storming-localfood](https://github.com/ppoox/cna-final-ops/assets/28284285/73aff464-4321-41fc-97fd-4c4e78949882)


## Saga/Compensation
### 상점(상품) 생성
![create-store](https://github.com/ppoox/cna-final-ops/assets/28284285/f4730b52-de33-4ccf-a817-ad31b2f632d3)

### 주문 생성
![create-order](https://github.com/ppoox/cna-final-ops/assets/28284285/ab521bf9-23d3-45b3-8709-11467cbd1684)

### 주문 조회
![cancel-order](https://github.com/ppoox/cna-final-ops/assets/28284285/cb4840c4-0aec-4077-823a-1abcd77ac8b8)

### Consumer console
![consumer](https://github.com/ppoox/cna-final-ops/assets/28284285/a1221ce2-d1ca-4074-9ad8-f8ecde58d778)


## Gateway
### Kiali
![kiali](https://github.com/ppoox/cna-final-ops/assets/28284285/eef9c8ea-be47-412c-a635-4ee53e19c390)
![kiali2](https://github.com/ppoox/cna-final-ops/assets/28284285/e78ff0b5-fa7d-4fb7-acd7-c560955391e6)


## CQRS
### 상점(상품) 생성
![cqrs-create-store](https://github.com/ppoox/cna-final-ops/assets/28284285/bc74ead4-04ea-4326-85af-9973a1ae965a)

### 주문 생성
![cqrs-create-order](https://github.com/ppoox/cna-final-ops/assets/28284285/fd8386f0-1c3f-4a42-8870-4447df7a41a3)

### 상품명 변경
![cqrs-update-product-name](https://github.com/ppoox/cna-final-ops/assets/28284285/ce7a2576-857e-49f0-af4b-a902887ce531)

### 주문 조회
![cqrs-select-order](https://github.com/ppoox/cna-final-ops/assets/28284285/81b5e59b-27f0-40ac-974c-06f5e90d70f1)

### Consumer console
![cqrs-consumer](https://github.com/ppoox/cna-final-ops/assets/28284285/e5a12b4c-8f19-4133-98dd-e5d6d86ac5aa)


## Cloud Deploy
### CodeBuild
![codebuild](https://github.com/ppoox/cna-final-ops/assets/28284285/31020708-c5f4-4795-9fd7-746d3b98f3ce)

### CodeBuild (Build history)
![codebuild-order](https://github.com/ppoox/cna-final-ops/assets/28284285/4c48d14a-b5ff-45d5-bf2c-88b37196ee7d)

### ECR
![ecr](https://github.com/ppoox/cna-final-ops/assets/28284285/522f2a6a-0f13-49d3-8cfa-160e518aef0a)

### S3 Pipeline cache bucket
![s3-bucket-pipeline-cache](https://github.com/ppoox/cna-final-ops/assets/28284285/2820e053-6207-4ec1-b70f-e2e5875d2be6)


## HPA
![delivery-hpa-before](https://github.com/ppoox/cna-final-ops/assets/28284285/402007ae-606f-4fdb-aa8d-389730a0e822)
![delivery-hpa-after](https://github.com/ppoox/cna-final-ops/assets/28284285/d1aeb621-d582-4ddd-8f94-fae46ab15378)


## ConfigMap
### ConfigMap 정보
![cm-describe](https://github.com/ppoox/cna-final-ops/assets/28284285/948fbd82-531e-4463-9cbf-c7613276b4a3)

### 상점(상품) 생성
![cm-create-store](https://github.com/ppoox/cna-final-ops/assets/28284285/5cff8529-a932-4046-b67c-42fec1acda85)

### 주문 생성
![cm-create-order](https://github.com/ppoox/cna-final-ops/assets/28284285/0f48268d-f59c-402c-ad25-007e7b5735c5)

### Consumer console
![cm-consumer](https://github.com/ppoox/cna-final-ops/assets/28284285/73eea82b-b00a-4620-aa2a-45e7f102257f)

### Order Service application.yaml (Store도 동일)
![cm-order-application-dev](https://github.com/ppoox/cna-final-ops/assets/28284285/4946d495-44f1-4db3-a8f3-ba58d7dceec9)

### Order Service buildspec.yaml (Store도 동일)
![cm-order-buildspec](https://github.com/ppoox/cna-final-ops/assets/28284285/2f3f7465-1522-4151-9399-18dc72c68c52)


## Liveness/ReadinessProbe
![readness-probe-1](https://github.com/ppoox/cna-final-ops/assets/28284285/bc64b4d3-e6de-4c20-a437-2d12500d15d3)
![readness-probe-2](https://github.com/ppoox/cna-final-ops/assets/28284285/47e10398-0f91-4095-8065-5e73426ac29a)
![readness-probe-3](https://github.com/ppoox/cna-final-ops/assets/28284285/457aebe1-710a-4390-924f-e2233c398229)


## Loggregation/Monitoring
![loggregation](https://github.com/ppoox/cna-final-ops/assets/28284285/2e3aca64-fb83-4023-bff9-fc0c5f78e4a3)
