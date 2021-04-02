pragma solidity ^0.6.0;


/**
 * @dev Interface of the BEP20 standard as defined in the EIP.
 */
interface IBEP20 {
    /**
     * @dev Returns the amount of tokens in existence.
     */
    function totalSupply() external view returns (uint256);

    /**
     * @dev Returns the amount of tokens owned by `account`.
     */
    function balanceOf(address account) external view returns (uint256);

    /**
     * @dev Moves `amount` tokens from the caller's account to `recipient`.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transfer(address recipient, uint256 amount) external returns (bool);

    /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through {transferFrom}. This is
     * zero by default.
     *
     * This value changes when {approve} or {transferFrom} are called.
     */
    function allowance(address owner, address spender) external view returns (uint256);

    /**
     * @dev Sets `amount` as the allowance of `spender` over the caller's tokens.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * IMPORTANT: Beware that changing an allowance with this method brings the risk
     * that someone may use both the old and the new allowance by unfortunate
     * transaction ordering. One possible solution to mitigate this race
     * condition is to first reduce the spender's allowance to 0 and set the
     * desired value afterwards:
     * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
     *
     * Emits an {Approval} event.
     */
    function approve(address spender, uint256 amount) external returns (bool);

    /**
     * @dev Moves `amount` tokens from `sender` to `recipient` using the
     * allowance mechanism. `amount` is then deducted from the caller's
     * allowance.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);

    /**
     * @dev Emitted when `value` tokens are moved from one account (`from`) to
     * another (`to`).
     *
     * Note that `value` may be zero.
     */
    event Transfer(address indexed from, address indexed to, uint256 value);

    /**
     * @dev Emitted when the allowance of a `spender` for an `owner` is set by
     * a call to {approve}. `value` is the new allowance.
     */
    event Approval(address indexed owner, address indexed spender, uint256 value);
}

/**
 * @dev Wrappers over Solidity's arithmetic operations with added overflow
 * checks.
 *
 * Arithmetic operations in Solidity wrap on overflow. This can easily result
 * in bugs, because programmers usually assume that an overflow raises an
 * error, which is the standard behavior in high level programming languages.
 * `SafeMath` restores this intuition by reverting the transaction when an
 * operation overflows.
 *
 * Using this library instead of the unchecked operations eliminates an entire
 * class of bugs, so it's recommended to use it always.
 */
library SafeMath {
    /**
     * @dev Returns the addition of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `+` operator.
     *
     * Requirements:
     *
     * - Addition cannot overflow.
     */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return sub(a, b, "SafeMath: subtraction overflow");
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting with custom message on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `*` operator.
     *
     * Requirements:
     *
     * - Multiplication cannot overflow.
     */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

    /**
     * @dev Returns the integer division of two unsigned integers. Reverts on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return div(a, b, "SafeMath: division by zero");
    }

    /**
     * @dev Returns the integer division of two unsigned integers. Reverts with custom message on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        return mod(a, b, "SafeMath: modulo by zero");
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts with custom message when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b != 0, errorMessage);
        return a % b;
    }
}


contract ICOSale {

	//For Debugging
	event Debug(string notes,uint opt1,uint opt2);
	
	using SafeMath for uint;
	
	address public governor;
	uint public priceInWei;
	uint8 public decimal;
	uint public closeTime;
	uint public startTime;
	uint public minBuy;
	uint public maxBuy;
	address public erc20;
	mapping(address => uint) public boughtAmount;

	constructor(address _governor,uint _initialPriceInWei,address _erc20TokenAddress, uint8 _decimal,uint _closeTime,uint _startTime,uint _minBuy,uint _maxBuy) public {
		governor = _governor;
		priceInWei = _initialPriceInWei;
		erc20 = _erc20TokenAddress;
		decimal = _decimal;
		closeTime = _closeTime;
		startTime = _startTime;
		minBuy = _minBuy;
		maxBuy = _maxBuy;
	}
	
	function BuyWithWei(uint _amount) external payable {
		require(_amount > minBuy,"Please Buy Atleast Minimum Amount!");
		require(boughtAmount[msg.sender] < maxBuy,"Max Buy Per Address Is Reached!");
		require(_amount == msg.value,"Please Match Correctly The Amount And Value!");
		require(closeTime > now,"Sale Is Now Closed!");
		require(startTime < now,"Sale Is Yet To Start!");
		uint _amounttosell = (_amount ** decimal).div(priceInWei);
		IBEP20(erc20).transfer(msg.sender,_amounttosell);
		boughtAmount[msg.sender] = boughtAmount[msg.sender].add(_amounttosell);
	}

	function AddReserves(uint _amount) external {
		require(msg.sender == governor,"Only Governor Can Add Reserves!");
		require(_amount > 0,"You Have To Add More Then 0 Tokens!");
		uint _allowance = IBEP20(erc20).allowance(msg.sender,address(this));
		require(_allowance >= _amount,"Please Approve The Contract Address With Amount To Be Reserved!");
		IBEP20(erc20).transferFrom(msg.sender,address(this),_amount);
	}

	function RemoveReserves(uint _amount) external {
		require(msg.sender == governor,"Only Governor Can Remove Reserves!");
		require(GetReserves() <= _amount,"Not Enough Token To Remove!");
		IBEP20(erc20).transfer(msg.sender,_amount);
	}

	function GetReserves() public view  returns (uint) {
		return IBEP20(erc20).balanceOf(address(this));
	}

	function GetWeiBalance() public view returns (uint) {
		return address(this).balance;
	}
	
	function WithdrawWei(uint _amount) external view {
		require(msg.sender == governor,"Only Governor Can Withdraw The Wei!");
		require(address(this).balance <= _amount,"Not Enough Wei Collected To Withdraw!");
		msg.sender.call.value(_amount);
	}

	function ChangePrice(uint _amount) external {
		require(msg.sender == governor,"Only Governor Can Change Price!");
		require(_amount > 0,"Price Cannot Be Zero!");
		priceInWei = _amount;
	}

	function GetBoughtAmount(address _address) public view returns (uint) {
		return boughtAmount[_address];
	}

	function changeCloseTime(uint _time) external {
		require(msg.sender == governor,"Only Governor Can Change The Closing Time!");
		closeTime = _time;
	}

	function changeStartTime(uint _time) external {
		require(msg.sender == governor,"Only Governor Can Change The Starting Time!");
		startTime = _time;
	}

	function changeMinBuy(uint _minBuy) external {
		require(msg.sender == governor,"Only Governor Can Change Minimum Purchase!");
		minBuy = _minBuy;
	}

	function changeMaxBuy(uint _maxBuy) external {
		require(msg.sender == governor,"Only Governor Can Change Max Tokens Per Address!");
		maxBuy = _maxBuy;
	}

	function changeGovernor(address _newGovernor) external {
		require(msg.sender == governor,"Only Governor Can Change The Governor!");
		governor = _newGovernor;
	}
	
}

contract ICOFactory {

	event NewICO(address _tokenAddress,address _c,address sender);
	function NewICOSale(uint _initialPriceInWei,address _tokenAddress,uint8 _decimal,uint _closeTime,uint _startTime,uint _minBuy,uint _maxBuy) public returns(address) {
		ICOSale c = new ICOSale(msg.sender,_initialPriceInWei,_tokenAddress,_decimal,_closeTime,_startTime,_minBuy,_maxBuy);
		emit NewICO(_tokenAddress,address(c),msg.sender);
		return address(c);
	}
	
}
