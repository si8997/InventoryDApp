// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Inventory {

    // 관리자 주소
    address public owner;

    // 생성자 - 배포한 사람이 관리자
    constructor() {
        owner = msg.sender;
    }

    // 관리자만 실행 가능하도록 제한
    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can perform this action.");
        _;
    }

    // 상품 구조체
    struct Product {
        string name;
        uint price;
        uint quantity;
        bool exists;
    }

    // 상품 ID => 상품 구조체
    mapping(uint => Product) public products;

    // 상품 수를 위한 카운터
    uint public productCount = 0;

    // 상품 추가 (관리자 전용)
    function addProduct(string memory _name, uint _price, uint _quantity) public onlyOwner {
        products[productCount] = Product(_name, _price, _quantity, true);
        productCount++;
    }

    // 재고 수정 (관리자 전용)
    function updateStock(uint _productId, uint _newQty) public onlyOwner {
        require(products[_productId].exists, "Not exist.");
        products[_productId].quantity = _newQty;
    }

    // 상품 정보 반환 (전체 공개)
    function getProduct(uint _productId) public view returns (string memory, uint, uint) {
        require(products[_productId].exists, "Not exist.");
        Product memory p = products[_productId];
        return (p.name, p.price, p.quantity);
    }

    // 특정 상품 삭제
    function deleteProduct(uint _productId) public onlyOwner {
    require(products[_productId].exists, "Product does not exist.");
    delete products[_productId];

    }

    // 전체 상품 목록 반환 (ID 배열 + 이름 배열 + 가격 배열 + 수량 배열)
    function getAllProducts() public view returns (
    uint[] memory, string[] memory, uint[] memory, uint[] memory, bool[] memory
) {
    uint count = productCount;
    uint[] memory ids = new uint[](count);
    string[] memory names = new string[](count);
    uint[] memory prices = new uint[](count);
    uint[] memory quantities = new uint[](count);
    bool[] memory existFlags = new bool[](count);

    for (uint i = 0; i < count; i++) {
        ids[i] = i;
        names[i] = products[i].name;
        prices[i] = products[i].price;
        quantities[i] = products[i].quantity;
        existFlags[i] = products[i].exists;
    }

    return (ids, names, prices, quantities, existFlags);

    }

} 
