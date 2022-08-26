/// @func   Multiply(arg1, arg2);
/// @param  {(Vector2|Matrix2x2)}   arg1
/// @param  {(Vector2|Matrix2x2)}   arg2
function Multiply(arg1, arg2)
{
	var val;
	if(arg1.type == "vector2") // arg2 must be Vector2 if arg1 is
	{
		return arg1.x * arg2.x + arg1.y * arg2.y; // calculates dot product
	}
	
	if(arg2.type == "vector2")
	{
		val = new Vector2(0,0);
		
		val.x = arg1.matrix[0][0] * arg2.x + arg1.matrix[0][1] * arg2.y;
		val.y = arg1.matrix[1][0] * arg2.x + arg1.matrix[1][1] * arg2.y;
		
		return val;
	}
	
	var arr;

	// Matrix multiplication
    arr[0][0] = arg1.matrix[0][0] * arg2.matrix[0][0] + arg1.matrix[0][1] * arg2.matrix[1][0];
    arr[0][1] = arg1.matrix[0][0] * arg2.matrix[0][1] + arg1.matrix[0][1] * arg2.matrix[1][1];
    arr[1][0] = arg1.matrix[1][0] * arg2.matrix[0][0] + arg1.matrix[1][1] * arg2.matrix[1][0];
    arr[1][1] = arg1.matrix[1][0] * arg2.matrix[0][1] + arg1.matrix[1][1] * arg2.matrix[1][1];

	val = new Matrix2x2(arr);
    return val;
}

///	@func				Det(vec1, vec2);
///	@param	{Vector2}	vec1
///	@param	{Vector2}	vec2
function Det(vec1, vec2){
	return vec1.x*vec2.x + vec1.y*vec2.y;
}

function Add(vec1, vec2){
	return new Vector2(vec1.x+vec2.x,vec1.y+vec2.y);
}

function Scaled(vec1, scalar){
	return new Vector2(vec1.x * scalar, vec1.y * scalar);
}

/// @func				Angle(vec1, vec2);
/// @param	{Vector2}	vec1
/// @param	{Vector2}	vec2
function Angle(vec1, vec2){
	if(vec1.GetLength() == 0 || vec2.GetLength() == 0){
		return 0;
	}
	return darccos(Det(vec1,vec2)/(vec1.GetLength() * vec2.GetLength()));
}