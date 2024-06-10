package com.kh.gorang.shopping.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class Product {
	
	private int productNo;
	private String seller;
	private String category;
	private String productName;
	private String productBrand;
	private int normalPrice;
	private int salePrice;
	private int discountPercent;
	private String mainImg;
	private String description;
	private String shipmentType;
	private int shipmentTime;
	private int shippingPrice;
	private int productView;
	private String status;
	
// Map<Product, List<ProductCart>> 로 묶을 때 객체key 동일 비교 위해 작성한 equals, hashCode 메소드
  @Override
    public boolean equals(Object o) {
	  	// 자기 자신과의 비교는 항상 true
	    if (this == o) return true;
	    // 비교 대상이 null이거나 클래스가 다르면 false
	    if (o == null || getClass() != o.getClass()) return false;

	    // Object를 Product 타입으로 캐스팅
	    Product product = (Product) o;

	    // productNo 필드를 기준으로 두 객체를 비교
	    return productNo == product.productNo;
    }

    @Override
    public int hashCode() {
        return productNo;
    }
/*
 * 
 * HashMap과 같은 해시 기반 컬렉션은 객체를 해시 코드를 기반으로 저장하고 검색합니다. 이 과정에서 다음 두 가지 규칙이 필요합니다:
	
	equals 메소드가 true를 반환하는 두 객체는 동일한 hashCode를 반환해야 합니다.
	hashCode가 동일한 두 객체가 반드시 equals 메소드에서도 true를 반환하지 않아도 되지만, 가능하면 그렇도록 설계하는 것이 좋습니다.
	이 규칙을 따르면 해시 기반 컬렉션에서 객체를 정확하고 효율적으로 저장하고 검색할 수 있습니다.
 * 
 * */
}
